//
//  MonumentRowView.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 07/05/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI

struct MonumentRowView: View {
    
    var monument: Monument

    var body: some View {
        
        VStack(alignment:.leading) {
            HStack(alignment: .center , spacing:15){
                Image("duomoComment")
                    .resizable()
                    .frame(width: 75, height: 75)
                .clipShape(Circle())
                    .shadow(color: Color.black.opacity(0.5), radius: 5, x: 5, y: 5)
                VStack(alignment:.leading) {
                    Text("\(monument.name)")
                        .font(.title)
                        .fontWeight(.light)
                }
            }.padding(.bottom)
            Text("\(monument.description[0 ..< 80])...")
                .font(.body)
                .fontWeight(.regular)
                .padding(.bottom)
        }
    }
    
}

struct MonumentRowView_Previews: PreviewProvider {
    static var previews: some View {
        MonumentRowView(monument: testMonument)
    }
}


