//
//  CommentView.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 07/05/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI

struct CommentListView: View {
    var body: some View {
        VStack{
            Text("Commenti")
                .font(.title)
            
            List(0..<5) { item in
                CommentRowView()
            }
        }
    }
}

struct CommentListView_Previews: PreviewProvider {
    static var previews: some View {
        CommentListView()
    }
}
