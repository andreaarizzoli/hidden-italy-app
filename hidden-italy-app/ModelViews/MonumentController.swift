//
//  MonumentController.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 14/05/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import Foundation
import Alamofire

class MonumentController: ObservableObject {
    
    @Published var monumentList = [Monument]()
    //@Published var monumentItem = MonumentItem()

    func getMonument() {
        print("test 01")

        AF.request("https://hiddenitaly.test/api/monuments",
                   method: .get)
                  // parameters: request)
            .responseJSON { response in
                
                switch response.result {
                    
                    case .success(_):
                        
                    do {
                        let jsonDecoder = JSONDecoder()
                        
                        let decoded = try jsonDecoder.decode([Monument].self, from: response.data!)
                        
                        self.monumentList = decoded
                        print("Converted JSON in struct \(decoded)")
                         
                    }
                    
                    catch {
                        print(error)
                    }
                case .failure(let error):
                    print("test 03")
                    print(error)

                }
        }
        
        
    }
    
}
