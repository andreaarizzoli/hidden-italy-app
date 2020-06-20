//
//  ApiWrapper.swift
//  hidden-italy-app
//
//  Created by Daniele Tulone on 19/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import Foundation
import Alamofire

func defaultFailure(res: Any) -> Void {
    print(res)
}

class ApiWrapper
{
    let baseURL: URL
    
    
    /**
     * Set private init for create a singleton
     *
     * @author Daniele Tulone
     */
    private init(baseURL: URL) {
        self.baseURL = baseURL
    }
    
    /**
     * Send generic function for create a request.
     *
     * @author Daniele Tulone
     */
    public func request<T: Codable, M: Codable> (
        uri: String,
        method: HTTPMethod,
        body: T,
        model: M,
        success: @escaping (_ res: Any?) -> Void,
        failure: @escaping (_ res: Any?) -> Void = defaultFailure,
        headers: HTTPHeaders = HTTPHeaders(),
        multiple: Bool = false
    ) -> Void {
        AF.request(
            "",
            method: method,
            parameters: body
        ).responseJSON{response in
            switch response.result {
                case .success(let data):
                    do {
                        let jsonDecoder = JSONDecoder()
                        
                        print((String(data: response.data!, encoding: .utf8)!))
                        
                        if (multiple) {
                            success(try jsonDecoder.decode(M.self, from: response.data!))
                        } else {
                            success(try jsonDecoder.decode([M].self, from: response.data!))
                        }
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
     * @author Daniele Tulone
     */
    public func get<T: Codable, M: Codable> (
        uri: String,
        body: T,
        model: M,
        success: @escaping (_ res: Any?) -> Void,
        failure: @escaping (_ res: Any?) -> Void,
        multiple: Bool = false
    ) -> Void {
        request(
            uri: uri,
            method: .get,
            body: body,
            model: model,
            success: success,
            failure: failure,
            multiple: multiple
        )
    }
    
    /**
     * Send a post request.
     *
     * @author Daniele Tulone
     */
    public func post<T: Codable, M: Codable> (
        uri: String,
        body: T,
        model: M,
        success: @escaping (_ res: Any?) -> Void,
        failure: @escaping (_ res: Any?) -> Void,
        multiple: Bool = false
        ) -> Void {
            request(
                uri: uri,
                method: .post,
                body: body,
                model: model,
                success: success,
                failure: failure,
                multiple: multiple
            )
    }
    
    /**
     * Send a patch request.
     *
     * @author Daniele Tulone
     */
    public func patch<T: Codable, M: Codable> (
        uri: String,
        body: T,
        model: M,
        success: @escaping (_ res: Any?) -> Void,
        failure: @escaping (_ res: Any?) -> Void,
        multiple: Bool = false
        ) -> Void {
            request(
                uri: uri,
                method: .patch,
                body: body,
                model: model,
                success: success,
                failure: failure,
                multiple: multiple
            )
    }
    
    /**
     * Send a delete request.
     *
     * @author Daniele Tulone
     */
    public func delete<T: Codable, M: Codable> (
        uri: String,
        body: T,
        model: M,
        success: @escaping (_ res: Any?) -> Void,
        failure: @escaping (_ res: Any?) -> Void,
        multiple: Bool = false
        ) -> Void {
            request(
                uri: uri,
                method: .delete,
                body: body,
                model: model,
                success: success,
                failure: failure,
                multiple: multiple
            )
    }
    
    /**
     * Send a multipart post request
     *
     * @author Daniele Tulone
     */
    public func postMultipart() {
        //
    }
}
