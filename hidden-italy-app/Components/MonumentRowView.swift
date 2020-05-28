//
//  MonumentRowView.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 07/05/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI
import URLImage

struct MonumentRowView: View {
    
    @State var monument: Monument
    var url = "http://127.0.0.1:8000/"

    var body: some View {
        
        VStack(alignment:.leading) {
            
            HStack(alignment: .center , spacing:15){
                if (monument.images.count > 0){
                    URLImage(URL(string: "\(url)storage/\(monument.images[0]!.url)")!, content: {
                        $0.image
                            .resizable()
                           .frame(width: 50, height: 50)
                           .clipShape(Circle())
                               .shadow(color: Color.black.opacity(0.5), radius: 5, x: 5, y: 5)
                    })
                } else {
                    Image("duomoComment")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.5), radius: 5, x: 5, y: 5)
                }
                VStack(alignment:.leading) {
                    Text("\(monument.name)")
                        .font(.custom("Avenir", size: 20))
                }
            }
            Text("\(monument.description[0 ..< 80])...")
                .font(.custom("Avenir", size: 16))
                .font(.body)
        }
    }
    
}

struct MonumentRowView_Previews: PreviewProvider {
    static var previews: some View {
        MonumentRowView(monument: testMonument)
    }
}


