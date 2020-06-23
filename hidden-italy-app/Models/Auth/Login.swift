//
//  Login.swift
//  hidden-italy-app
//
//  Created by Daniele Tulone on 23/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import Foundation

/**
 * The model used for login response.
 *
 * @author Daniele Tulone <danieletulone.work@gmail.com>
 */
struct Login: Codable {
    
    /**
     * The api token. It's a jwt token.
     *
     * @author Daniele Tulone <danieletulone.work@gmail.com>
     */
    var token: String
    
    /**
     * The user data.
     *
     * @author Daniele Tulone <danieletulone.work@gmail.com>
     */
    var user: User
}
