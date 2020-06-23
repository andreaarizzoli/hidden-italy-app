//
//  Register.swift
//  hidden-italy-app
//
//  Created by Daniele Tulone on 23/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import Foundation

/**
 * The model used for register response.
 *
 * @author Daniele Tulone <danieletulone.work@gmail.com>
 */
struct Register: Codable {
    
    /**
    * The user data.
    *
    * @author Daniele Tulone <danieletulone.work@gmail.com>
    */
    var user: User
}
