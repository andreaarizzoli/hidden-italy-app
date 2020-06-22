//
//  Icon.swift
//  hidden-italy-app
//
//  Created by Daniele Tulone on 21/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI

struct Icon: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.system(size: 30))
            .foregroundColor(Color(Accent))
    }
}
