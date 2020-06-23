//
//  Comment.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 20/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import Foundation

struct Comment: Codable, Identifiable {
    var id: Int
    var content: String
    var user_id: Int
    var monument_id: Int
    var created_at: String?
    var updated_at: String?
    var user: User
}
