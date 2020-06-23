//
//  CommentView.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 07/05/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI
import ValidatedPropertyKit

struct CommentListView: View {
        
    @State var monument: Monument
    @ObservedObject var comments = CommentViewModel()
    @ObservedObject var users = UserViewModel()
    @State var isShowingTextComment: Bool = false
    @State var newComment: String = ""
    @State var commentNotification: Bool = false
    var characterLimitDescription = 250
    
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
                    }) {
                        
                        Image(systemName: "message")
                        
                    }.buttonStyle(PlainButtonStyle())
                    
                }.padding(.bottom)
                
                if (self.isShowingTextComment) {
                    if (self.commentNotification) {
                        Text("Commento aggiunto!")
                        .fontWeight(.light)
                        .padding()
                        .onAppear(perform: {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                withAnimation {
                                    self.isShowingTextComment = false
                                    self.commentNotification = false

                                }
                            }
                        })
                    } else {

                        HStack {

                            TextView(placeholderText: "Inserisci commento...",
                            text: $newComment, limit: self.characterLimitDescription,
                            size: 17, weightFont: .light).frame(numLines: 2)

                            Button(action: {
                                
                                let monumentId = self.monument.id
                                if (self.comments.validate(userId: 1, monumentId: monumentId, comment: self.newComment)) {
                                    
                                    self.newComment = ""
                                    
                                    self.commentNotification = true

                                }
                            }) {
                                if (self.newComment == "") {
                                    Image(systemName: "paperplane").foregroundColor(Color .gray)
                                } else {
                                    Image(systemName: "paperplane").foregroundColor(Color(Accent))
                                }
                            }.buttonStyle(PlainButtonStyle())
                        }.modifier(FormTextField()).padding(.bottom)
                    }

                }
                
                ForEach(self.monument.comments){ comment in
                    CommentRow(comment: comment)
                }
                
            }.padding(.horizontal,30)
        }
        
    }
}



struct CommentListView_Previews: PreviewProvider {
    static var previews: some View {
        CommentListView(monument: testMonument)
    }
}

