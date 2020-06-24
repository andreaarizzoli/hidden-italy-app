//
//  Shadow.swift
//  hidden-italy-app
//
//  Created by Daniele Tulone on 24/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI

/**
 * Modifier for general shadow.
 *
 * @author Alberto Giacomini
 * @author Andra Arizzoli
 * @author Daniele Tulone <danieletulone.work@gmail.com>
 */
struct Shadow: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .shadow(
                color: Color(darkShadow),
                radius: 10,
                x: 10,
                y: 10
            )
            .shadow(
                color: Color.white.opacity(0.7),
                radius: 10,
                x: -10,
                y: -10
            )
    }
}
