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
    var user: String
    var category: String
}

