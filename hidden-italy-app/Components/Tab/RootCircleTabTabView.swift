//
//  TestTabView.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 07/05/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI

struct TestTabView: View {
    
    @State var index = 0
    
    var body: some View {
        
        VStack {
            Spacer()
            
            ZStack{
                if (self.index == 0) {
                    Color.red
                } else if (self.index == 1) {
                    Color.yellow
                } else if (self.index == 2) {
                    Color.orange
                } else if (self.index == 3) {
                    Color.green
                } else {
                    Color.pink
                }
            }
            
            CircleTab(index: self.index)
        }
        .background(Color.black.opacity(0.05)
        .edgesIgnoringSafeArea(.top))
    }
}

struct TestTabView_Previews: PreviewProvider {
    static var previews: some View {
        TestTabView()
    }
}
