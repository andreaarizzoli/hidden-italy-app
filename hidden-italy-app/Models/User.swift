//
//  User.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 07/05/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import Foundation

struct User: Codable, Identifiable {
    var id: Int
    var firstname: String
    var lastname: String
    var email: String
    var email_verified_at: String
    var role_id: Int
    var created_at: String?
    var updated_at: String?
    var role: Role?
}


