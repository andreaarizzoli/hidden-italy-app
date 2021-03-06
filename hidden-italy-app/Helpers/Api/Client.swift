//
//  Client.swift
//  hidden-italy-app
//
//  Created by Daniele Tulone on 19/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import Foundation
import Alamofire

func defaultFailure(res: Any) -> Void {
    UserViewModel.setApiToken(token: "")
}

class Client
{
    
    /**
     * The base url for api
     *
     * @author Daniele Tulone <danieletulone.work@gmail.com>
     * @var String
     */
    let baseURL: String = "http://127.0.0.1:8000/api"
    
    /**
     * Headers using for multipart form-data requests.
     *
     * @author Daniele Tulone <danieletulone.work@gmail.com>
     */
    let multipartHeaders : HTTPHeaders = [
        "Content-type": "multipart/form-data",
        "Accept": "application/json"
    ]
    
    /**
     * The requests queue.
     *
     * @author Daniele Tulone <danieletulone.work@gmail.com>
     */
    var queue: [String: DataRequest] = [:]
    
    /**
     * The static instance for this singleton class.
     *
     * @author Daniele Tulone <danieletulone.work@gmail.com>
     */
    static let shared = Client()
    
    /**
     * Set private init for use this class as a singleton
     *
     * @author Daniele Tulone <danieletulone.work@gmail.com>
     */
    private init() {}
    
    /**
     * Send generic function for create a request.
     *
     * @author Daniele Tulone <danieletulone.work@gmail.com>
     */
    public func request<T: Codable, M: Codable> (
        uri: String,
        method: HTTPMethod,
        body: T,
        model: M.Type,
        success: @escaping (_ res: Any?) -> Void,
        failure: @escaping (_ res: Any?) -> Void = defaultFailure,
        headers: HTTPHeaders = HTTPHeaders([
            "Authorization": "Bearer " + UserViewModel.getToken(),
            "Accept": "application/json"
        ]),
        multiple: Bool = false,
        name: String = "request"
    ) -> Void {
        self.cancel(name: name)
        
        self.queue[name] = AF.request(
            self.baseURL + uri,
            method: method,
            parameters: body,
            headers: headers
        ).responseJSON{response in
            switch response.result {
                case .success(let data):
                    do {
                        let jsonDecoder = JSONDecoder()
                        
                        if (multiple) {
                            success(try
                                jsonDecoder.decode(
                                    [M].self,
                                    from: response.data!
                                )
                            )
                        } else {
                            success(try
                                jsonDecoder.decode(
                                    M.self,
                                    from: response.data!
                                )
                            )
                        }
                        
                        self.queue[name] = nil
                    }
                    catch
                    {
                        failure(data)
                    }
                case .failure(_):
                    failure(response)
            }
        }
    }
    
    /**
     * Send a get request.
     *
     * @author Daniele Tulone <danieletulone.work@gmail.com>
     */
    public func get<T: Codable, M: Codable> (
        uri: String,
        body: T,
        model: M.Type,
        success: @escaping (_ res: Any?) -> Void,
        failure: @escaping (_ res: Any?) -> Void = defaultFailure,
        multiple: Bool = false,
        name: String = "request"
    ) -> Void {
        self.request(
            uri: uri,
            method: .get,
            body: body,
            model: model,
            success: success,
            failure: failure,
            multiple: multiple,
            name: name
        )
    }
    
    /**
     * Send a post request.
     *
     * @author Daniele Tulone <danieletulone.work@gmail.com>
     */
    public func post<T: Codable, M: Codable> (
        uri: String,
        body: T,
        model: M.Type,
        success: @escaping (_ res: Any?) -> Void,
        failure: @escaping (_ res: Any?) -> Void = defaultFailure,
        multiple: Bool = false,
        name: String = "request"
    ) -> Void {
        self.request(
            uri: uri,
            method: .post,
            body: body,
            model: model,
            success: success,
            failure: failure,
            multiple: multiple,
            name: name
        )
    }
    
    /**
     * Send a patch request.
     *
     * @author Daniele Tulone <danieletulone.work@gmail.com>
     */
    public func patch<T: Codable, M: Codable> (
        uri: String,
        body: T,
        model: M.Type,
        success: @escaping (_ res: Any?) -> Void,
        failure: @escaping (_ res: Any?) -> Void = defaultFailure,
        multiple: Bool = false,
        name: String = "request"
    ) -> Void {
        self.request(
            uri: uri,
            method: .patch,
            body: body,
            model: model,
            success: success,
            failure: failure,
            multiple: multiple,
            name: name
        )
    }
    
    /**
     * Send a delete request.
     *
     * @author Daniele Tulone <danieletulone.work@gmail.com>
     */
    public func delete<T: Codable, M: Codable> (
        uri: String,
        body: T,
        model: M.Type,
        success: @escaping (_ res: Any?) -> Void,
        failure: @escaping (_ res: Any?) -> Void = defaultFailure,
        multiple: Bool = false,
        name: String = "request"
    ) -> Void {
        self.request(
            uri: uri,
            method: .delete,
            body: body,
            model: model,
            success: success,
            failure: failure,
            multiple: multiple,
            name: name
        )
    }
    
    /**
     * Send a multipart post request
     *
     * @author Daniele Tulone
     */
    public func postMultipart(
        uri: String,
        params: MultipartFormData,
        failure: @escaping (_ res: Any?) -> Void = defaultFailure,
        name: String = "request",
        headers: HTTPHeaders = HTTPHeaders([
            "Authorization": "Bearer " + UserViewModel.getToken(),
            "Accept": "application/json"
        ])
    ) {
        self.cancel(name: name)
        
        AF.upload(multipartFormData: params, to: self.baseURL + uri, headers: headers)
            .responseJSON{response in
                switch response.result {
                    case .success(let data):
                        print(data)
                        self.queue[name] = nil
                    case .failure(_):
                        print(response.data)
                }
        }
    }
    
    /**
     * Cancel a request.
     *
     * @author Daniele Tulone <danieletulone.work@gmail.com>
     */
    public func cancel(name: String = "request") -> Void {
        guard self.queue[name] != nil else {
            return
        }
        
        self.queue[name]?.cancel()
        self.queue[name] = nil
    }
    
    /**
     * Cancel all requests.
     *
     * @author Daniele Tulone <danieletulone.work@gmail.com>
     */
    public func cancelAll() -> Void {
        for (key, _) in self.queue {
            self.cancel(name: key)
        }
    }
}
