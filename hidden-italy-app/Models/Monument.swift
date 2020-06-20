//
//  Monument.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 07/05/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import Foundation

struct Monument: Codable, Identifiable {
    var id: Int
    var name: String
    var description: String
    var lat: Double
    var lon: Double
    var visible: Bool
    var user_id: Int
    var category_id: Int
    var category: Category
    var distance: Double
    var created_at: String?
    var updated_at: String?
    var categories: [Category?]
    var images: [ImageModel?]
}

let testMonument = Monument(id: 1, name: "Duomo di Milano", description: "blablabal", lat: 00, lon: 00, visible: true, user_id: 1, category_id: 1, category: Category(id: 1, description: "", created_at: "", updated_at: ""), distance: 1.1, created_at: "sjodjifs",  updated_at: "blabla", categories: [], images: [])
