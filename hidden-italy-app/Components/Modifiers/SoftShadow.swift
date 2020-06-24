//
//  SoftShadow.swift
//  hidden-italy-app
//
//  Created by Daniele Tulone on 24/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI

struct SoftShadow: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .shadow(
                color: Color.black.opacity(0.5),
                radius: 5,
                x: 5,
                y: 5
            )
        
    }
}
