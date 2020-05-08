//
//  Crud.swift
//  hidden-italy-app
//
//  Created by Daniele Tulone on 08/05/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import Foundation
import Alamofire

func perform<T: Decodable>(
        _ apiRoute: APIRouteable,
        completion: @escaping (Result<T, T>) -> Void
) -> Void {
    let dataRequest = AF.request(apiRoute)
    
    dataRequest
        .validate(statusCode: 200..<300)
        .responseJSON{response in
            let responseData = response.data ?? Data()
            let string = String(data: responseData, encoding: .utf8)
            print("Response string: \(string ?? "")")
            
            switch response.result {
                case .success(let response):
                    completion(.success(response))
                case .failure(let error):
                    completion(.failure(error))
            }
        })
}
