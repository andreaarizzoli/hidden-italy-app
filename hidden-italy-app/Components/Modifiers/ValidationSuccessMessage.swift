//
//  ValidationSuccessMessage.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 23/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI

struct ValidationSuccessMessage: ViewModifier{
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color .white)
            .frame(maxWidth: .infinity, minHeight: 120)
            .background(Color(Accent))
            .cornerRadius(15)
            .padding(.horizontal, 40)
            .modifier(Shadow())
    }
}
