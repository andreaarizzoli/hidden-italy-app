//
//  BrokenRulesView.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 19/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI

struct BrokenRulesView: View {
    
    let brokenRules: [BrokenRule]
    
    var body: some View {
        VStack {
            Text("Errori:")
            List(self.brokenRules, id: \.id) { brokenRule in
                Text(brokenRule.message)
                Text("errore")
            }
        }.background(Color.green)
    }
}

//struct BrokenRulesView_Previews: PreviewProvider {
//    static var previews: some View {
//        BrokenRulesView(brokenRules: [])
//    }
//}

struct BrokenRulesView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
