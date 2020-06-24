//
//  SheetExpandable.swift
//  hidden-italy-app
//
//  Created by Daniele Tulone on 24/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import Foundation
import SwiftUI

class SheetExpandable: ObservableObject {
    
    @Published var startPoint = CGRect(
        x: 0,
        y: 0,
        width: 100,
        height: 100
    )
    
    @Published var returnPoint = CGRect(
        x: 0,
        y: 0,
        width: 100,
        height: 100
    )
    
    @Published var shown = false
    
    @Published var willHide = false
    
    @Published var itemHeight:CGFloat = 350
    
    @Published var imageHeight:CGFloat = 300
    
    @Published var SVWidth = UIScreen.main.bounds.width - 60
}
