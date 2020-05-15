//
//  Image.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 14/05/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import Foundation

struct ImageModel: Codable, Identifiable {
    var id: Int
    var title: String
    var description: String
    var url: String
    var monument_id: Monument
    var user_id: User
}
