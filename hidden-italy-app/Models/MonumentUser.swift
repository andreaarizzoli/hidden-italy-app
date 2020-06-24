//
//  MonumentUser.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 24/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import Foundation

struct MonumentUser: Codable {
    var id: Int
    var user_id: Int
    var monument_id: Int
    var created_at: String?
    var updated_at: String?
}
