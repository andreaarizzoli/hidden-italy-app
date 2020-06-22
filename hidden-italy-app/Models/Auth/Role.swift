//
//  Role.swift
//  hidden-italy-app
//
//  Created by Daniele Tulone on 23/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import Foundation

struct Role: Codable {
    var id: Int
    var name: String
    var scopes: [String]?
    var created_at: String?
    var updated_at: String?
}
