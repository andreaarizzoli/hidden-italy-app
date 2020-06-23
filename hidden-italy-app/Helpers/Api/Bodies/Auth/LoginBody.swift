//
//  Login.swift
//  hidden-italy-app
//
//  Created by Daniele Tulone on 22/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import Foundation

/**
 * Body for obtain a token and user data.
 *
 * @author Daniele Tulone <danieletulone.work@gmail.com>
 */
struct LoginBody: Codable {
    
    /**
     * The email to send. Validation only back side.
     *
     * @author Daniele Tulone <danieletulone.work@gmail.com>
     */
    var email: String
    
    /**
     * The password to send.
     *
     * @author Daniele Tulone <danieletulone.work@gmail.com>
     */
    var password: String
}
