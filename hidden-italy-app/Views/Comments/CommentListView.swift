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
    @ObservedObject var comments = CommentViewModel()
    @State var isShowingTextComment: Bool = false
    @State var newComment: String = ""
    
    var body: some View {
        ZStack {
            VStack() {
                        
                HStack{
                    
                    Text("Commenti:")
                    
                    Spacer()
                    
                    Button(action: {
                        withAnimation {
                            if (self.isShowingTextComment){
                                self.isShowingTextComment = false
                            } else {
                                self.isShowingTextComment = true
                            }
                        }
                        print(self.$newComment)
                        
                    }) {
                        Image(systemName: "message")
                    }.buttonStyle(PlainButtonStyle())
                }
                
                if (isShowingTextComment) {
                    HStack {
                        TextField("Inserisci comment", text: self.$newComment)
                        Button(action: {
                            withAnimation {
                                self.isShowingTextComment = false
                            }
                        }) {
                        Image(systemName: "paperplane")
                        }.buttonStyle(PlainButtonStyle())
                    }.modifier(FormTextField()).padding(.bottom)
                }
        
                ForEach(self.monument.comments){ comment in
                    CommentRow(comment: comment)
                }
                
            }.padding(.horizontal).padding(.top)
//            .onAppear {
//                self.comments.get(monument_id: self.monument.id)
//            }
        }
        
    }
}



struct CommentListView_Previews: PreviewProvider {
    static var previews: some View {
        CommentListView(monument: testMonument)
    }
}

