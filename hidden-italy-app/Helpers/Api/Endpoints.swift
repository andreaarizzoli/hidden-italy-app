//
//  Endpoints.swift
//  hidden-italy-app
//
//  Created by Daniele Tulone on 21/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import Foundation

enum Endpoints {
    enum Monuments {
        static var findNearest: String = "/v1/monuments/find-nearest"
        static var index: String = "/v1/monuments"
        
        static func show (id: String) -> String {
            return "/v1/monuments/" + id
        }
    }
    
    enum Categories {
        static var index: String = "/v1/categories"
        
        static func show (id: String) -> String {
            return "/v1/categories/" + id
        }
    }
}
