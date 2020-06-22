//
//  CommentViewModel.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 21/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import Foundation

class CommentViewModel :ObservableObject {
                
    @Published var CommentList = [Comment]()
    @Published var testComment = Comment(
        id: 1,
        content: "Blablabla",
        user_id: 0,
        monument_id: 1,
        created_at: "",
        updated_at: "",
        user: User(
            id: 1,
            firstname: "Jack",
            lastname: "Sparrot",
            email: "alskdlsfk",
            email_verified_at: "salkdlfa",
            role_id: 1,
            created_at: "dklfaksd",
            updated_at: "lsdfkjlas"
        )
    )
        
    func create(userId: Int, monumentId: Int, comment: String) {
        
        post(
            uri: Endpoints.Comments.create,
            body: CreateComment(
                user_id: userId,
                monument_id: monumentId,
                content: comment
            ),
            model: Comment.self,
            success: {res in
            self.CommentList = res as! [Comment]
            }
        )
    }

    
    func validate(userId: Int, monumentId: Int, comment: String) -> Bool {
        
        var response: Bool = false
        
        if (comment != "" && comment.count <= 250) {
            create(userId: userId, monumentId: monumentId, comment: comment)
            response = true
        }
        
        return response
    }
}
