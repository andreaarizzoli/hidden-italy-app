//
//  AllertX.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 19/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI
import AlertX

struct AlertXView: View {
        
        @State var showAlertX: Bool = false
    
        let buttons = [
        AlertX.Button.default(Text("Yes")),
        AlertX.Button.default(Text("No")),
        AlertX.Button.cancel()
        ]
    
    
      var body: some View {
            Button(action: {
                
                self.showAlertX.toggle()
                
            }, label: {
                
                Text("Show AlertX")
                
            }).alertX(isPresented: $showAlertX, content: {
                
                AlertX(title: Text("Scegli la categoria:"),
                       message: Text("An optional message indicating some action goes here..."),
                       primaryButton: .cancel(),
                       secondaryButton: .default(Text("Done"), action: {
                        // Some action
                       }),
                       theme: .graphite(withTransparency: true, roundedCorners: true),
                       animation: .classicEffect())
            })
      }
    
    
}


struct AlertXView_Previews: PreviewProvider {
    static var previews: some View {
        AlertX(title: Text("AlertX Title"))
    }
}
