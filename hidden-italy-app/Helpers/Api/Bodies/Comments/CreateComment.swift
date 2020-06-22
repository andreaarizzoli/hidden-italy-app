//
//  CreateComment.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 22/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import Foundation

/**
 * Body for create comment.
 *
 * @author Andrea Arizzoli <andrea.arizzoli@ied.edu>
 */
struct CreateComment: Codable {
    var user_id: Int
    var monument_id: Int
    var content: String
    var page: Int?
    var per_page: Int?
    var distance: Int?
}
