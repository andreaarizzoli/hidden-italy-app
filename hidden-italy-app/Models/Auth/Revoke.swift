//
//  Revoke.swift
//  hidden-italy-app
//
//  Created by Daniele Tulone on 23/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import Foundation

struct Revoke: Codable {
    
    /**
     * If true tells that token has been revoked correctly.
     *
     * @author Daniele Tulone <danieletulone.work@gmail.com>
     */
    var revoked: Bool
}
