//
//  CommentItemView.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 07/05/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI



struct CommentRowView: View {
    init() {
       UITableView.appearance().tableFooterView = UIView()
    }
    
    var body: some View {
        VStack(alignment:.leading) {
            HStack(alignment: .top){
                Image("duomoComment")
                    .resizable()
                    .frame(width: 65, height: 65)
                    .clipShape(Circle())
                    .shadow(
                        color: Color.black.opacity(0.5),
                        radius: 5, x: 5, y: 5
                    )
                    .padding(.leading)
                    .padding(.trailing)
                
               
                
                VStack(alignment:.leading) {
                    HStack(){
                        Text("zola91")
                        .font(.custom("Avenir-Black", size: 16))
                        .fontWeight(.regular)
                        .padding(.bottom)
                        Text("24 mar 19:00")
                            .font(.caption)
                        .fontWeight(.regular)
                        .padding(.bottom)
                    }
                    
                    Text("Il duomo è molto carino e pieno di negozi.")
                        .font(.body)
                        .fontWeight(.regular)
                        .padding(.bottom)
                    
                    
                }
            }
        }
    }
}

struct CommentRowView_Previews: PreviewProvider {
    static var previews: some View {
        CommentRowView()
    }
}
