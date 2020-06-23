//
//  RegisterBody.swift
//  hidden-italy-app
//
//  Created by Daniele Tulone on 23/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import Foundation

/**
 * Body for make register request.
 * This body cannot provide automatically the token.
 *
 * @author Daniele Tulone <danieletulone.work@gmail.com>
 */
struct RegisterBody: Codable {
    
    /**
     * The firstname to send.
     *
     * @author Daniele Tulone <danieletulone.work@gmail.com>
     */
    var firstname: String = ""
    
    /**
     * The lastname to send.
     *
     * @author Daniele Tulone <danieletulone.work@gmail.com>
     */
    var lastname: String = ""
    
    /**
     * The email to send. Validation only back side.
     *
     * @author Daniele Tulone <danieletulone.work@gmail.com>
     */
    var email: String = ""
    
    /**
     * The password to send.
     *
     * @author Daniele Tulone <danieletulone.work@gmail.com>
     */
    var password: String = ""
    
    /**
     * The retype password to send. This value must match with password field.
     *
     * @author Daniele Tulone <danieletulone.work@gmail.com>
     */
    var password_confirmation: String = ""
}
