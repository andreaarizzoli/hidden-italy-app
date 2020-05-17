//
//  Category.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 07/05/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import Foundation
import Alamofire
import Combine

struct Category: Codable, Identifiable {
    var id: Int
    var description: String
    var created_at: String
    var updated_at: String?

}

class CategoryApi {
    func getCategories() {
        
    AF.request("http://127.0.0.1:8000/api/categories",
               method: .get)
        .responseJSON { response in
            debugPrint(response)
            print(response)
        }
        
//        switch response.result {
//
//            case .success(_):
//
//            do {
//                let jsonDecoder = JSONDecoder()
//
//                let decoded = try jsonDecoder.decode([Monument].self, from: response.data!)
//
//                self.monumentList = decoded
//                print("Converted JSON in struct \(decoded)")
//
//            }
//
//            catch {
//                print(error)
//            }
//        case .failure(let error):
//            print("test 03")
//            print(error)
//
//        }
    }
}
