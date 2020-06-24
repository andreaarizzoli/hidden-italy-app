//
//  SheetImage.swift
//  hidden-italy-app
//
//  Created by Daniele Tulone on 24/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import Foundation
import SwiftUI
import URLImage

struct SheetImage: View {
    @EnvironmentObject var monuments: MonumentViewModel
    @EnvironmentObject var sheetExpandable: SheetExpandable
        
    var body: some View {
        URLImage(
            URL(string: baseImageURL() + self.monuments.testMonument.images[0]!.url)!,
            processors: [
                Resize(
                    size: CGSize(
                        width: self.sheetExpandable.SVWidth,
                        height: self.sheetExpandable.itemHeight
                    ),
                    scale: UIScreen.main.scale
                )
            ],
            placeholder: {_ in
                VStack (alignment: .center){
                    CircleSpinner()
                        .frame(width: 50.0, height: 50.0)
                }
            },
            content: {
                $0.image
                    .resizable()
                    .clipped()
                    .cornerRadius(radius: 35, corners: [.bottomLeft, .bottomRight])
                    .modifier(Shadow())

            }
        )
    }
}

