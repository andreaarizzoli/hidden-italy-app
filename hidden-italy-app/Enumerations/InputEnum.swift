//
//  InputEnum.swift
//  hidden-italy-app
//
//  Created by Daniele Tulone on 23/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import Foundation

/**
 * Enumeration that contains allowed types of input.
 *
 * @author Daniele Tulone <danieletulone.work@gmail.com>
 */
enum InputEnum: String {
    
    /**
     * Text is visible and first letter of each sentece is uppercase.
     *
     * @author Daniele Tulone <danieletulone.work@gmail.com>
     */
    case text
    
    /**
     * Text is visible and first letter is lowercase.
     *
     * @author Daniele Tulone <danieletulone.work@gmail.com>
     */
    case email
    
    /**
     * Text is not visible and first letter is lowercase.
     *
     * @author Daniele Tulone <danieletulone.work@gmail.com>
     */
    case password
}
