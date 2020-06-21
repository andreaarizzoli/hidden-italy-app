//
//  CrudFunctions.swift
//  hidden-italy-app
//
//  Created by Daniele Tulone on 19/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import Foundation

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
 * Get the base api url.
 *
 * @author Daniele Tulone <danieletulone.work@gmail.com>
 */
func baseApiURL() -> String {
    return Client.shared.baseURL
}
