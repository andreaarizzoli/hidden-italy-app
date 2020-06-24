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
                .modifier(Shadow())
        )
    }
}
