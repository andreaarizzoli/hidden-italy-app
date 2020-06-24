//
//  CircleSpinner.swift
//  hidden-italy-app
//
//  Created by Daniele Tulone on 24/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import Foundation
import SwiftUI

struct CircleSpinner: View {
    
    @State var spin: Bool = false
    
    var body: some View {
        Circle()
            .trim(from: 0.0, to: 0.3)
            .stroke(lineWidth: 10.0)
            .opacity(0.3)
            .foregroundColor(Color(darkAccent))
            .rotationEffect(Angle(degrees: spin ? 360 : 0))
            .animation(
                Animation.easeInOut(duration: 0.8)
                    .repeatForever(autoreverses: false)
        ).onAppear(perform: {
            self.spin.toggle()
        })
    }
}
