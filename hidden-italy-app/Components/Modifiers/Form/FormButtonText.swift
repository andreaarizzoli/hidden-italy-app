//
//  FormButtonText.swift
//  hidden-italy-app
//
//  Created by Daniele Tulone on 21/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI

struct FormButtonText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color.white)
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
    }
}
