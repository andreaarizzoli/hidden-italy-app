//
//  BgSafeArea.swift
//  hidden-italy-app
//
//  Created by user172259 on 22/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI

struct BgSafearea: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color(BGColor))
            .edgesIgnoringSafeArea(.top)
    }
}


