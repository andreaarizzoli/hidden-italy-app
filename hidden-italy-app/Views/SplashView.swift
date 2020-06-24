//
//  SplashView.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 04/05/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI

struct SplashView: View {
    
    @State var spin = false
    
    var body: some View {
        ZStack {            
            VStack {
                Image("logo").padding(.top, 200).padding(.bottom)
                    .font(.system(size: 18))
                    .foregroundColor(Color(darkAccent))
                            
                Spacer()
                
                ZStack {
                    Circle()
                        .trim(from: 0.0, to: 0.3)
                        .stroke(lineWidth: 10.0)
                        .opacity(0.3)
                        .foregroundColor(Color(darkAccent))
                        .rotationEffect(Angle(degrees: spin ? 360 : 0))
                        .animation(
                            Animation.easeInOut(duration: 0.8)
                                .repeatForever(autoreverses: false)
                        )
                        
                       
                }
                .frame(width: 50.0, height: 50.0)
                .padding(.vertical, 100)
                .onAppear(perform: {
                    self.spin.toggle()
                })
               
            }.frame(minWidth: 0, maxWidth: .infinity)
            .frame(minHeight: 0, maxHeight: .infinity)
            .background(Color(BGColor)).edgesIgnoringSafeArea(.vertical)
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}


