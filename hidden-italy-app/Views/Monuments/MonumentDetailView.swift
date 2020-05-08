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
            Image("duomo")
                .resizable()
                .scaledToFit()
            
            Text("Duomo di Milano")
                .font(.largeTitle)
            
            Text("Questa è una descrizione test per il monumento. ")
                .padding(.horizontal, 10)
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
