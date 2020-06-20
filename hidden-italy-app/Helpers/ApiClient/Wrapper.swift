//
//  Wrapper.swift
//  hidden-italy-app
//
//  Created by Daniele Tulone on 19/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import Foundation
import Alamofire

struct Results<Element: Decodable>: Decodable {
    //
}

func defaultFailure(res: Any) -> Void {
    print(res)
}

class ApiWrapper
{
    
    /**
     * The base url for api
     *
     * @author Daniele Tulone <danieletulone.work@gmail.com>
     * @var String
     */
    let baseURL: String = "http://127.0.0.1:8000/api"
    
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
    static let shared = ApiWrapper()
    
    /**
     * Set private init for create a singleton
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
        headers: HTTPHeaders = HTTPHeaders(),
        multiple: Bool = false,
        name: String = "request"
    ) -> Void {
        self.cancel(name: name)
        
        self.queue[name] = AF.request(
            self.baseURL + uri,
            method: method,
            parameters: body
        ).responseJSON{response in
            switch response.result {
                case .success(let data):
                    do {
                        let jsonDecoder = JSONDecoder()
                        
                        print((String(data: response.data!, encoding: .utf8)!))
                        
                        if (multiple) {
                            success(try jsonDecoder.decode(Results<M>.self, from: response.data!))
                        } else {
                            success(try jsonDecoder.decode(Results<M>.self, from: response.data!))
                        }
                        
                        self.queue[name] = nil
                    }
                    catch
                    {
                        failure(data)
                    }
                case .failure(let error):
                    print(error)
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
    public func postMultipart() {

    }
    
    public func cancel(name: String = "request") -> Void {
        guard self.queue[name] != nil else {
            return
        }
        
        self.queue[name]?.cancel()
        self.queue[name] = nil
    }
}
