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
               Image("logo")
                Text("Scoprire ciò che ti circonda")
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}


