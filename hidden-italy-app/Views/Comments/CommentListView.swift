//
//  CommentView.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 07/05/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI

struct CommentListView: View {
        
    @State var monument: Monument
   // @ObservedObject var comments = CommentViewModel()
    @State var count = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("Commenti")
                .font(.headline)
                .fontWeight(.bold)
                .padding(Edge.Set.leading, 30)
            
            Text("\(monument.comments.count)")
            Text("\(monument.comments[0]!.content)")
            
//            for (comment, in count) {
//                Text(monument.comments[0]?.content)
//            }
            
        }.padding(.trailing)
//        .onAppear {
//            self.comments.get(monument_id: self.monument.id)
//        }
    }
}



struct CommentListView_Previews: PreviewProvider {
    static var previews: some View {
        CommentListView(monument: testMonument)
    }
}
