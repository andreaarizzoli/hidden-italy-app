//
//  CommentView.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 07/05/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI

struct CommentListView: View {
    init() {
       UITableView.appearance().separatorStyle = .none
    }
    
//    @State var delay = 0.7
    
    var body: some View {
        VStack(alignment: .leading){
            
            Text("Commenti")
                .font(.headline)
                .fontWeight(.bold)
                .padding(Edge.Set.leading, 30)
                
          ScrollView{
            ForEach(0..<15) { item in
                CommentRowView()
//                    .animation(Animation.easeOut(duration: 0.7))
                
            }
            }
        }.padding(.trailing)
    }
}

struct CommentListView_Previews: PreviewProvider {
    static var previews: some View {
        CommentListView()
    }
}
