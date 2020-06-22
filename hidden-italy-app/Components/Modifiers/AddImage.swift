//
//  AddImage.swift
//  hidden-italy-app
//
//  Created by user172259 on 22/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI

struct AddImage: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            
            .background(RoundedRectangle(cornerRadius: 35)
                .fill(Color(BGColor))
                .shadow(color: Color(darkShadow), radius: 10, x: 10, y: 10)
                .shadow(color: Color.white.opacity(0.7), radius: 10, x: -10, y: -10))
        
    }
}
