//
//  ButtonExit.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 23/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI

struct ButtonExit: ViewModifier{
    func body(content: Content) -> some View {
        content
            
            .foregroundColor(Color(Accent))
            .font(.system(size: 25))
}
}


