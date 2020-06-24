//
//  FormTextField.swift
//  hidden-italy-app
//
//  Created by Daniele Tulone on 21/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI

struct FormTextField: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .padding(15)
            .background(
                Capsule()
                    .fill(Color(BGColor))
                    .modifier(Shadow())
            )
    }
}
