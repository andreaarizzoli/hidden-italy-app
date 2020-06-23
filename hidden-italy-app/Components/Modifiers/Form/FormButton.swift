//
//  FormButton.swift
//  hidden-italy-app
//
//  Created by Daniele Tulone on 21/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI

struct FormButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            
            .background(Capsule()
                .fill(Color(Accent))
                .shadow(color: Color(darkShadow), radius: 10, x: 10, y: 10)
                .shadow(color: Color.white.opacity(0.7), radius: 10, x: -10, y: -10)
//                .overlay(Capsule(style: .continuous)
//                    .stroke(Color(darkAccent).opacity(0.7), style: StrokeStyle(lineWidth: 4))
//                    .shadow(color: Color(BGColor), radius: 2, x: 4, y: 4)
//                .clipShape(Capsule())
//                    .shadow(color: Color(darkAccent), radius: 2, x: -2, y: -2)
//                    .clipShape(
//                        Capsule())
        )
//                    .foregroundColor(Color.white)
    
    }
}
