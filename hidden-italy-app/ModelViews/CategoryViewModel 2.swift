//
//  CategoryController.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 18/05/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import Foundation
import Alamofire
import Combine

class CategoryViewModel :ObservableObject {
    
  //  @Published var categoriesList = [Category] ()
    @Published var categoriesList: [Category] = [
        .init(
            id: 1,
            description: "Descrizione",
            created_at: "stringa",
            updated_at: "stringa")
    ]
    
    private var apiUrl = "http://127.0.0.1:8000/api/categories"
    
    func getCategories() {
        
        AF.request(self.apiUrl,method: .get).responseJSON { response in

            switch response.result {
            case .success(_):
                do {
                    let jsonDecoder  = JSONDecoder()
                    let decode = try jsonDecoder.decode([Category].self, from: response.data!)
                    self.categoriesList = decode
                    //print("Converted JSON in struct \(self.categoriesList)")
                }
                catch {
                    print(error)
                }
            case .failure(let error):
                print(error)
            }
        }
        
//        guard let url = URL(string: apiUrl) else { return }
//        URLSession.shared.dataTask(with: url) { (data, resp, err) in
//            DispatchQueue.main.async {
//                self.categoriesList = try! JSONDecoder().decode([Category].self, from: data!)
//            }
//        }.resume()
    }
}
