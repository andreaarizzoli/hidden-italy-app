//
//  LoginText.swift
//  hidden-italy-app
//
//  Created by Daniele Tulone on 21/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI

struct LoginText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color.gray.opacity(0.5))
    }
}
