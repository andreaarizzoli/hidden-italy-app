//
//  Colors.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 04/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import Foundation
import SwiftUI

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}

let Accent = UIColor(rgb: 0x486aec)
let lightAccent = UIColor(rgb: 0x77c4ff)
let darkAccent = UIColor(rgb: 0x0957be)
let offWhite = UIColor(rgb: 0xFEFEFE)

//let shadow =  #colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1.0)

let BGColor = UIColor(rgb: 0xDEEAF6)
//let BGColor = UIColor(rgb: 0xdbe2ef)
let lightShadow = UIColor(rgb: 0x3f72af)
let darkShadow = UIColor(rgb: 0xAEAEC0)

let redAlert = UIColor(rgb: 0xe14646)
