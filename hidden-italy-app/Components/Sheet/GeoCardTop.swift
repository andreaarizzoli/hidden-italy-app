//
//  GeoCardTop.swift
//  hidden-italy-app
//
//  Created by Daniele Tulone on 24/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import Foundation
import SwiftUI

struct GeoCardTop: View {
    @EnvironmentObject var monuments: MonumentViewModel
    @EnvironmentObject var sheetExpandable: SheetExpandable
    
    var body: some View {
        ZStack{
            if (self.sheetExpandable.shown) {
                SheetImage()
            }
            
            VStack{
                
                HStack{
                    
                    VStack(alignment: .leading){
                        
                        Text("\(self.monuments.testMonument.name)")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.bottom)
                        
                        Text("\(self.monuments.testMonument.category.description)")
                            .padding(.vertical, 3)
                            .padding(.horizontal, 10)
                            .font(.system(size: 18, weight: .light, design: .default))
                            .foregroundColor(Color(Accent))
                            .background(Capsule()
                            .fill(Color .white))
                        
                    }.padding(.horizontal)
                    
                    Spacer()
                    
                }.offset(y: self.self.sheetExpandable.shown ? 44 : 0)
                
                Spacer()
                
                }.frame(width: self.self.sheetExpandable.startPoint.width)
        }
        .frame(height:
            self.sheetExpandable.itemHeight
        ).zIndex(1)
    }
}
