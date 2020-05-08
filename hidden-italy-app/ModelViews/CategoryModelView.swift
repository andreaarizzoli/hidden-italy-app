//
//  CategoryModelView.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 07/05/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import Foundation

class CategoryModelView: ObservableObject{
    @Published var category: Category?
   
    init() {
        self.category = Category(
            id: 0,
            description: ""
        )
    }
    
}
