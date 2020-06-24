//
//  SplashView.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 04/05/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI

struct SplashView: View {
        
    var body: some View {
        ZStack {            
            VStack {
                Image("logo").padding(.top, 200).padding(.bottom)
                    .font(.system(size: 18))
                    .foregroundColor(Color(darkAccent))
                            
                Spacer()
                
                ZStack {
                    CircleSpinner()
                }
                .frame(width: 50.0, height: 50.0)
                .padding(.vertical, 100)
               
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


