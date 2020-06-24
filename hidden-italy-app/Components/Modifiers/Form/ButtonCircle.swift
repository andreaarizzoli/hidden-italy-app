//
//  ButtonCircle.swift
//  hidden-italy-app
//
//  Created by user172259 on 21/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI

struct ButtonCircle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(
                Circle()
                    .fill(Color(BGColor))
                    .modifier(Shadow())
            )
    }
}
