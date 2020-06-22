//
//  CommentItemView.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 07/05/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI

struct CommentRow: View {

    @ObservedObject var comments = CommentViewModel()
    @State var comment: Comment
    
    
    var body: some View {
        VStack(alignment:.trailing) {
            HStack(alignment: .top){
                
                Image("placeHolderProfile")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
                    .shadow(
                        color: Color.black.opacity(0.5),
                        radius: 5, x: 5, y: 5
                    )
                    .padding(.trailing)
                                
                VStack(alignment:.leading) {
                    Text("\(comment.user.firstname) \(comment.user.lastname)")
                    .font(.system(size: 14))
                    .fontWeight(.light)

                    Text("\(comment.content)")
                    .font(.system(size: 14))

                }
                Spacer()
            }.padding(.horizontal).padding(.top)
        }
    }
}

struct CommentRowView_Previews: PreviewProvider {
    static var previews: some View {
        CommentRow(comment: CommentViewModel().testComment)
    }
}
