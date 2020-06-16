//
//  MonumentController.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 14/05/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import Foundation
import Alamofire
import Combine

class MonumentViewModel: ObservableObject {
    
    @Published var monumentList = [Monument]()
    @Published var userCoordinates = LocationManager()
    
    let parameters = [
        "lat": "45.441683",
        "lon": "9.1916211"
    ]
    
    private var apiUrl = "http://127.0.0.1:8000/api/monuments"

    func getMonuments() {
        
        AF.request(self.apiUrl ,method: .get).responseJSON { response in

            switch response.result {
            case .success(_):
                do {
                    let jsonDecoder  = JSONDecoder()
                    let decode = try jsonDecoder.decode([Monument].self, from: response.data!)
                    self.monumentList = decode
//                    print("Converted JSON in struct \(self.monumentList)")
                }
                catch {
                    print("Error reading JSON file: \(error.localizedDescription) Error description: \(error)")
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getNearMonuments() {
        
        AF.request(self.apiUrl + "/findNearest" ,method: .post, parameters:parameters, encoding: JSONEncoding.default).responseJSON { response in
//            print(response)
            print("trovato\(self.userCoordinates)")

            switch response.result {
            case .success(_):
                do {
                    let jsonDecoder  = JSONDecoder()
                    let decode = try jsonDecoder.decode([Monument].self, from: response.data!)
                    self.monumentList = decode
                    print("Converted JSON in struct \(self.monumentList)")
                }
                catch {
                    print("Error reading JSON file: \(error.localizedDescription) Error description: \(error)")
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func shortDescription(description: String){
        //description.stringByPaddingToLength(3, withString: "", startingAtIndex: 0)
       // var response = "blablabla"
       // return response
    }
}


