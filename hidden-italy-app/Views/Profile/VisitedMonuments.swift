//
//  VisitedMonuments.swift
//  hidden-italy-app
//
//  Created by user172259 on 18/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI

struct VisitedMonuments : View {
    
    var body: some View{
        
        GeometryReader{_ in
            
            HStack(alignment: .center){
                
                Text("Monumenti Visitati")
            }
        }
    }
}

struct VisitedMonuments_Previews: PreviewProvider {
    static var previews: some View {
        VisitedMonuments()
    }
}
