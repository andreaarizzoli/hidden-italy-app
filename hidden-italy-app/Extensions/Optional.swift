//
//  Optional.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 19/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import Foundation

extension Optional where Wrapped == String {
    var _bound: String? {
        get {
            return self
        }
        set {
            self = newValue
        }
    }
    
    public var bound: String {
        get {
            return _bound ?? ""
        }
        set {
            _bound = newValue.isEmpty ? nil : newValue
        }
    }
}
