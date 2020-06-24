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
                Image("logo").padding(.bottom)
                Text("Scoprire ciò che ti circonda")
                    .font(.system(size: 18))
                    .foregroundColor(Color(darkAccent))
            }.frame(minWidth: 0, maxWidth: .infinity)
            .frame(minHeight: 0, maxHeight: .infinity)
            .background(Color(BGColor)).edgesIgnoringSafeArea(.top)
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}


