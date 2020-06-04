//
//  MonumentView.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 07/05/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI
import URLImage

struct MonumentDetailView: View {
    
    var monument: Monument
    
    var url = "http://127.0.0.1:8000/"
    
    var body: some View {
        VStack{
            ZStack (alignment: .bottom){
                URLImage(URL(string: "\(url)storage/\(monument.images[0]!.url)")!, content: {
                    $0.image
                        .resizable()
//                        .scaledToFill()
                        .frame(height: 250)
                })

                Rectangle()
                .frame(height: 80)
                .opacity(0.30)
                .blur(radius: 10)
                 
                Text("\(monument.name)")
                    .font(.largeTitle)
                    .foregroundColor(Color.white)
            }

            Text("\(monument.description)")
                .padding(.horizontal, 2)
                .padding(.vertical, 10)
            
            CommentListView()
        }
    }
}

struct MonumentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MonumentDetailView(monument: testMonument)
    }
}

