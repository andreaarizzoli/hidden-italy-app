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
                .fill(Color(BGColor))
                .shadow(color: Color(darkShadow), radius: 10, x: 10, y: 10)
                .shadow(color: Color.white.opacity(0.7), radius: 10, x: -10, y: -10))
            
                .overlay(Capsule(style: .continuous)
                    .stroke(Color(bgColor).opacity(0.7), style: StrokeStyle(lineWidth: 3))
                    .foregroundColor(Color(BGColor)))
    }
}
