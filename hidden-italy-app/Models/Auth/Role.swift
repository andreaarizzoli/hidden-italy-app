//
//  Role.swift
//  hidden-italy-app
//
//  Created by Daniele Tulone on 23/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import Foundation

struct Role: Codable {
    
    /**
     * The role id.
     *
     * @author Daniele Tulone <danieletulone.work@gmail.com>
     */
    var id: Int
    
    /**
     * The name of role.
     *
     * @author Daniele Tulone <danieletulone.work@gmail.com>
     */
    var name: String
    
    /**
     * List of all scopes.
     *
     * @author Daniele Tulone <danieletulone.work@gmail.com>
     */
    var scopes: [String]?
    
    /**
     * The creation date.
     *
     * @author Daniele Tulone <danieletulone.work@gmail.com>
     */
    var created_at: String?
    
    /**
     * The last update date.
     *
     * @author Daniele Tulone <danieletulone.work@gmail.com>
     */
    var updated_at: String?
    
    /**
     * Check if current user has a scope.
     *
     * @author Daniele Tulone <danieletulone.work@gmail.com>
     */
    func hasScope(scope: ScopesEnum) -> Bool {
        return self.scopes?.contains(scope.rawValue) ?? false
    }
}
