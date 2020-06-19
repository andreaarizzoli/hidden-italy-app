//
//  ProfileScore.swift
//  hidden-italy-app
//
//  Created by user172259 on 18/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI

struct ProfileScore: View {
    var body: some View {
        
        VStack(alignment: .center){
            GeometryReader{_ in
                
                VStack{
                    
                    Text("Punteggio").padding(.bottom, 100)
                    Text("Hai 20000 punti!").padding (.bottom, 20)
                    Spacer()
                }
            }
            
        }
        
    }
}

struct ProfileScore_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScore()
    }
}
