//
//  MonumentRowView.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 07/05/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI

struct MonumentRowView: View {
    var body: some View {
        
        VStack(alignment:.leading) {
            HStack(alignment: .center , spacing:15){
                Image("duomo")
                    .resizable()
                    .frame(width: 75, height: 75)
                .clipShape(Circle())
                    .shadow(color: Color.black.opacity(0.5), radius: 5, x: 5, y: 5)
                VStack(alignment:.leading) {
                    Text("Duomo di Milano")
                        .font(.title)
                        .fontWeight(.light)
                }
            }
            Text("Questa è una descrizione test per il monumento. ")
                .padding(.horizontal, 15)
        }
    }
    
}

struct MonumentRowView_Previews: PreviewProvider {
    static var previews: some View {
        MonumentRowView()
    }
}
