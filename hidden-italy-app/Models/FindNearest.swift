//
//  FindNearest.swift
//  hidden-italy-app
//
//  Created by Daniele Tulone on 23/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import Foundation

struct FindNearest: Codable {
    var id: Int
    var name: String
    var distance: Double
    var category: Category
    var images: [ImageModel]
    var lat: Double
    var lon: Double
}
