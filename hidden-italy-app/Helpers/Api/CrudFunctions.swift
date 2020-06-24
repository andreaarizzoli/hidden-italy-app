//
//  CrudFunctions.swift
//  hidden-italy-app
//
//  Created by Daniele Tulone on 19/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//
//  ALL METHODS ARE SORTED FROM a to Z

import Foundation
import Alamofire

func baseImageURL() -> String {
    return "http://127.0.0.1:8000/storage/"
}

/**
 * Get the base api url.
 *
 * @author Daniele Tulone <danieletulone.work@gmail.com>
 */
func baseApiURL() -> String {
    return Client.shared.baseURL
}

/**
 * Cancel a request.
 *
 * @author Daniele Tulone <danieletulone.work@gmail.com>
 */
func cancel(name: String = "request") -> Void {
    Client.shared.cancel(name: name)
}

/**
 * Cancel all requests.
 *
 * @author Daniele Tulone <danieletulone.work@gmail.com>
 */
func cancelAll() -> Void {
    Client.shared.cancelAll()
}

/**
 * Get the endpoint uri from endpoint cases.
 *
 * @author Daniele Tulone <danieletulone.work@gmail.com>
 */
func endpoint(_ endpoint: Endpoints) -> String {
    return endpoint.rawValue
}

/**
 * Create a get request using api wrapper singleton.
 *
 * @author Daniele Tulone <danieletulone.work@gmail.com>
 */
func get<T: Codable, M: Codable>(
    uri: String,
    body: T,
    model: M.Type,
    success: @escaping (_ res: Any?) -> Void,
    failure: @escaping (_ res: Any?) -> Void = defaultFailure,
    name: String = "request"
) -> Void {
    Client.shared.get(
        uri: uri,
        body: body,
        model: model,
        success: success,
        failure: failure,
        multiple: false,
        name: name
    )
}

/**
 * Create a get request for multiple resources using api wrapper singleton.
 *
 * @author Daniele Tulone <danieletulone.work@gmail.com>
 */
func getAll<T: Codable, M: Codable>(
    uri: String,
    body: T,
    model: M.Type,
    success: @escaping (_ res: Any?) -> Void,
    failure: @escaping (_ res: Any?) -> Void = defaultFailure,
    name: String = "request"
) -> Void {
    Client.shared.get(
        uri: uri,
        body: body,
        model: model,
        success: success,
        failure: failure,
        multiple: true,
        name: name
    )
}

/**
* Create a post request using api wrapper singleton.
*
* @author Daniele Tulone <danieletulone.work@gmail.com>
*/
func post<T: Codable, M: Codable>(
    uri: String,
    body: T,
    model: M.Type,
    success: @escaping (_ res: Any?) -> Void,
    failure: @escaping (_ res: Any?) -> Void = defaultFailure,
    multiple: Bool = false,
    name: String = "request"
) -> Void {
    Client.shared.post(
        uri: uri,
        body: body,
        model: model,
        success: success,
        failure: failure,
        multiple: multiple,
        name: name
    )
}

func postMultipart(
    uri: String,
    params: MultipartFormData
) {
    Client.shared.postMultipart(
        uri: uri,
        params: params
    )
}

func prepareMultipart(data: [String: Any]) -> MultipartFormData {
    let multipart = MultipartFormData()
        
    for (key, val) in data {
        if let data = val as? String {
            multipart.append(Data((data).utf8), withName: key)
        }
        
        if let data = val as? Int {
            multipart.append(Data(("\(data)").utf8), withName: key)
        }
        
        if let data = val as? UIImage {
            let image = data.jpegData(compressionQuality: 0.2)!

            multipart.append(
                image,
                withName: key,
                fileName: UUID().uuidString,
                mimeType: "image/jpeg"
            )
        }
    }
    
    return multipart
}
