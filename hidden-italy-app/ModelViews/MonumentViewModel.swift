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
    
   // @Published var monumentList = [Monument]()
    
    @Published var monumentList: [Monument] = [
        .init(
            id: 1,
            name: "Descrizione",
            description: "Descrizione",
            lat: "1.1",
            lon: "1.1",
            user_id: 1,
            category_id: 1,
            //categories: MonumentCategory,
            //images: [ImageModel?],
            created_at: "Data creazione",
            updated_at: "Data creaione"
        )
    ]
    
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
    
    func shortDescription(description: String){
        //description.stringByPaddingToLength(3, withString: "", startingAtIndex: 0)
       // var response = "blablabla"
       // return response
    }
    
    
}


