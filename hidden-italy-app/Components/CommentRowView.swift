//
//  CommentItemView.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 07/05/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI

struct CommentRowView: View {
    var body: some View {
        VStack(alignment:.leading) {
            HStack(alignment: .center , spacing:15){
                Image("duomoComment")
                    .resizable()
                    .frame(width: 65, height: 65)
                    .clipShape(Circle())
                    .shadow(
                        color: Color.black.opacity(0.5),
                        radius: 5, x: 5, y: 5
                    )
                
                VStack(alignment:.leading) {
                    Text("Il duomo è molto carino")
                        .font(.title)
                        .fontWeight(.light)
                    
                    HStack(){
                        Text("Creato da: zola91")
                        Spacer()
                    }
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
