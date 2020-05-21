//
//  MonumentView.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 07/05/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI

struct MonumentDetailView: View {
    
    var body: some View {
        VStack{
            ZStack (alignment: .bottom){
                Image("duomoComment")
                     .resizable()
                     //.scaledToFit()
                    
                     .frame(height: 250)
                
                Rectangle()
                .frame(height: 80)
                .opacity(0.30)
                .blur(radius: 10)
                 
                 Text("Duomo di Milano")
                     .font(.largeTitle)
                    .foregroundColor(Color.white)
            }
        
 
            
                
            Text("Questa è una descrizione test per il monumento. ")
                .padding(.horizontal, 2)
                .padding(.vertical, 10)
            
            CommentListView()
        }
        
    }
}

struct MonumentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MonumentDetailView()
    }
}
