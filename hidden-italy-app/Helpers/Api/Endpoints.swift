//
//  Endpoints.swift
//  hidden-italy-app
//
//  Created by Daniele Tulone on 21/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//
//  ALL CASES AND METHODS ARE SORTED BY TOPIC -> TYPE -> a to Z

import Foundation

/**
 * Enumeration that contians all api (first-party) endpoints.
 *
 * @author Daniele Tulone <danieletulone.work@gmail.com>
 */
enum Endpoints: String {
    
    //------------------
    //  AUTHENTICATION
    //------------------
    
    /**
     * Endpoint used for obtain api token.
     *
     * @author Daniele Tulone <danieletulone.work@gmail.com>
     */
    case login = "/v1/auth/login"
    
    /**
     * Endpoint used for create a new user. This not provides token.
     *
     * @author Daniele Tulone <danieletulone.work@gmail.com>
     */
    case register = "/v1/auth/register"
    
    /**
     * Endpoint used for revoke api token.
     *
     * @author Daniele Tulone <danieletulone.work@gmail.com>
     */
    case revoke = "/v1/auth/revoke"
    
    //-----------------
    //    MONUMENTS
    //-----------------
    
    /**
     * Endpoint used for find monuments around current user location.
     *
     * @author Daniele Tulone <danieletulone.work@gmail.com>
     */
    case findNearestMonuments = "/v1/monuments/find-nearest"
    
    /**
     * Endpoint used for get all monuments.
     *
     * @author Daniele Tulone <danieletulone.work@gmail.com>
     */
    case indexMonuments = "/v1/monuments"
    
    /**
     * Endpoint used for get all details about a single monument.
     *
     * @author Daniele Tulone <danieletulone.work@gmail.com>
     */
    static func showMonument (id: Int) -> String {
        return "/v1/monuments/" + String(id)
    }
    
    //------------------
    //    CATEGORIES
    //------------------
        
    /**
     * Endpoint used for get all categories.
     *
     * @author Daniele Tulone <danieletulone.work@gmail.com>
     */
    case indexCategories = "/v1/categories"
    
    /**
     * Enpoint used for get all details about single category.
     *
     * @author Daniele Tulone <danieletulone.work@gmail.com>
     */
    static func showCategory (id: Int) -> String {
        return "/v1/categories/" + String(id)
    }
    
    //-----------------
    //    COMMENTS
    //-----------------
    
    case createComment = "/v1/comments"
    
    //-----------------
    //    USERS
    //-----------------
   
    /**
     * Endpoint used for upload profile image.
     *
     * @author Daniele Tulone <danieletulone.work@gmail.com>
     */
    case uploadProfileImage = "/v1/users/image"
    
    case userMonument = "/v1/users/monuments"
    
    /**
     * Endpoint used for get info about current logged user.
     *
     * @author Daniele Tulone <danieletulone.work@gmail.com>
     */
    case showUser = "/v1/users/info"
}
