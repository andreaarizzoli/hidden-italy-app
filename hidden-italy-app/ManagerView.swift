//
//  ManagerView.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 04/05/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI

struct ManagerView: View {
    @State private var flagStart = false
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
   
       
    var body: some View {
       Group{
           
           if (self.flagStart) {
               LoginView()
                //RootTabView()

                   .transition(AnyTransition.opacity.combined(with: .slide))
            
           } else {
               SplashView()
                .onReceive(self.timer) {
                    input in self.flagStart = true
               }
           }
       }
    }
}

struct ManagerView_Previews: PreviewProvider {
    static var previews: some View {
        ManagerView()
    }
}
