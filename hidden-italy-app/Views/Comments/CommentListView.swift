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
    @State var isShowingTextComment: Bool = false
    @State var errorMessage: Bool = false
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
                                self.errorMessage = false
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
                            
                            let monumentId = self.monument.id
                            if (self.comments.validate(userId: 1, monumentId: monumentId, comment: self.newComment)) {
                                withAnimation {
                                    self.isShowingTextComment = false
                                    self.errorMessage = false
                                }
                            } else {
                                withAnimation (.spring()){
                                    self.errorMessage = true
                                }
                            }
                        }) {
                        Image(systemName: "paperplane")
                        }.buttonStyle(PlainButtonStyle())
                    }.modifier(FormTextField()).padding(.bottom)
                }
                
                if(self.errorMessage) {
                    Text("Commenta con massimo 250 caratteri!").modifier(ValidationErrorMessage())
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

