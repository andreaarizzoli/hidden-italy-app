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
    var lat: String
    var lon: String
    var user_id: Int
    var category_id: Int
    var created_at: String
    var updated_at: String?
    //var categories: [MonumentCategory?]
    //var images: [ImageModel?]
}

let testMonument = Monument(id: 1, name: "Duomo di Milano", description: "blablabal", lat: "00", lon: "00", user_id: 1, category_id: 1, created_at: "sjodjifs",  updated_at: "blabla")
