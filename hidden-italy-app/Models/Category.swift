//
//  Category.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 07/05/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import Foundation

struct Category: Codable, Identifiable {
    var id: Int
    var description: String
    var created_at: String?
    var updated_at: String?
    
//    init(id: Int, description: String,  created_at: String ,updated_at: String? = nil) {
//        self.id = 1
//        self.description = "descrizione"
//        self.created_at = "data"
//        self.updated_at = "data"
//    }

}

