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

