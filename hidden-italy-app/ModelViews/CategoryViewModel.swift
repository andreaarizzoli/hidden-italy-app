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
        
    func getCategories() {
        
        getAll(uri: Endpoints.Categories.index, body: EmptyBody(), model: Category.self, success: {res in
            self.categoriesList = res as! [Category]
        })
    }
}
