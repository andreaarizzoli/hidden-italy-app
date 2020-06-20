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
    
    @Published var categoriesList = [Category] ()
    
    private var apiUrl = "http://127.0.0.1:8000/api/categories"
    
    func getCategories() {
    
        struct Parameters : Codable {}
        
        getAll(uri: "/v1/categories", body: Parameters(), model: Category.self, success: {res in
            self.categoriesList = res as! [Category]
        })
    }
}
