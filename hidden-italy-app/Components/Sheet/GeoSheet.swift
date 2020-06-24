//
//  GeoSheet.swift
//  hidden-italy-app
//
//  Created by Daniele Tulone on 24/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import Foundation
import SwiftUI
import URLImage
import UIKit

struct GeoSheet: View {
    
    @Binding var geo: GeometryProxy?
    
    @EnvironmentObject var monuments: MonumentViewModel
    @EnvironmentObject var sheetExpandable: SheetExpandable
    
    var body: some View {
        
        GeometryReader{geo -> AnyView in
            
            self.geo = geo
                        
            return AnyView (
                
                ZStack {
                    ScrollView{
                        VStack(spacing:0){
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
                            
                            VStack(alignment: .leading) {
                                Text("Informazioni")
                                    .font(.system(
                                        size: 18,
                                        weight: .bold,
                                        design: .default
                                        )
                                ).padding(.bottom, 15)
                                
                                Text(self.monuments.testMonument.description).lineSpacing(10)
                            }.padding(.vertical, 50).padding(.horizontal, 30)
                            
                        }
                        
                        Button(action:{}){
                            SheetMap()
                        }
                        
                        if (self.self.sheetExpandable.shown) {
                            CommentListView(monument: self.monuments.testMonument).padding(.bottom, 150)
                        }
                        
                    }
                    .background(Color (BGColor))
                    .frame(width: self.sheetExpandable.startPoint.width, height: self.sheetExpandable.startPoint.height)
                    .background(Color.clear)
                    .cornerRadius(self.sheetExpandable.shown ? 0 : 15 )
                    .animation(.easeInOut(duration: 0.3))
                    .offset(x: self.sheetExpandable.startPoint.minX, y: self.sheetExpandable.startPoint.minY)
                    
                    Button(action: {
                        self.sheetExpandable.willHide = true
                        self.sheetExpandable.startPoint = self.sheetExpandable.returnPoint
                        
                        self.sheetExpandable.shown = false
                        Timer.scheduledTimer(withTimeInterval: 0.6, repeats: false) { (timer) in
                            self.sheetExpandable.willHide = false
                        }
                    }){
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(Color(Accent))
                            .font(.system(size: 25))
                            .padding()
                            .opacity(self.self.sheetExpandable.shown ? 1 : 0.0)
                            .animation(
                                Animation.easeInOut(duration: 0.3))
                    }.offset(x: (UIScreen.main.bounds.width/2) - 30, y: (-1 * UIScreen.main.bounds.height/2) + 60)
                }
            )
        }.edgesIgnoringSafeArea(.top)
            .opacity(self.sheetExpandable.shown ? 1 : 0.0)
            .animation(
                Animation.easeInOut(duration: 0.05)
                    .delay(self.sheetExpandable.willHide ? 0.5 : 0))
    }
}

