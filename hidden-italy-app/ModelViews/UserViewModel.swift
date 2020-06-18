//
//  UserViewModel.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 18/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import Foundation
import Alamofire
import Combine

class UserViewModel :ObservableObject {
    
    //@Published var user = User()
    
    private var apiUrl = "http://127.0.0.1:8000/api/register"
    
    func createUser(name: String, surname: String, email: String, password: String) {
        
//        let parameters: [String: AnyObject] = [
//            "firstname" : name as AnyObject,
//            "lastname" : surname as AnyObject,
//            "email" : email as AnyObject,
//            "password" : password as AnyObject,
//        ]
//
//        let user: User = [
//             "firstname" : name as AnyObject,
//             "lastname" : surname as AnyObject,
//             "email" : email as AnyObject,
//             "password" : password as AnyObject,
//         ]
//
//        let data = Data("data".utf8)

//        AF.upload(parameters, to: "http://127.0.0.1:8000/api/register").responseDecodable(of: HTTPBinResponse.self) { response in
//            debugPrint(response)
//        }
    }
}
