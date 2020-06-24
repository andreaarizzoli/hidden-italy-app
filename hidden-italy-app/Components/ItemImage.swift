//
//  ItemImage.swift
//  hidden-italy-app
//
//  Created by Daniele Tulone on 24/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import Foundation
import SwiftUI
import URLImage

struct ItemImage: View {
    
    @State var zIndex: Double = 20.0
    
    var item: FindNearest
    var width: CGFloat
    var height: CGFloat
    var context: CIContext
    
    var body: some View {
        URLImage(
            URL(string: baseImageURL() + item.images[0].url)!,
            processors: [
                CoreImageFilterProcessor(
                    name: "CISepiaTone",
                    parameters: [ kCIInputIntensityKey: 0.2 ],
                    context: context),
                    Resize(size: CGSize(width: self.width, height: self.height),
                    scale: UIScreen.main.scale
                )
            ],
            placeholder: {_ in
                VStack (alignment: .center){
                    CircleSpinner()
                        .frame(width: 50.0, height: 50.0)
                }
                .frame(width: self.width, height: self.height)
                .background(Color(BGColor))
                .onDisappear(perform: {
                    self.zIndex = 0
                })
            },
            content: {
                $0.image
                    .resizable()
                    .clipped()
            }
        ).zIndex(self.zIndex)
    }
}
