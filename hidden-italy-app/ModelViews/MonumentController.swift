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

class MonumentController {
    
    @Published var monumentList = [Monument]()
    
    func getMonuments() {
        
        AF.request("http://127.0.0.1:8000/api/monuments",method: .get).responseJSON { response in
            print(response)
            
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
}
