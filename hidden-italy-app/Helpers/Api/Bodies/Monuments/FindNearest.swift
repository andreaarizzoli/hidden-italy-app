//
//  FindNearest.swift
//  hidden-italy-app
//
//  Created by Daniele Tulone on 21/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import Foundation

/**
 * Body for find-nearest monuments.
 *
 * @author Daniele Tulone <danieletulone.work@gmail.com>
 */
struct FindNearest: Codable {
    var lat: Double
    var lon: Double
    var page: Int?
    var per_page: Int?
    var distance: Int?
}
