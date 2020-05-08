//
//  UserModelView.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 07/05/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//
//
import Foundation

class UserModelView: ObservableObject{
    @Published var user: User?
   
    init() {
        
        self.user = User(
            id: 0,
            name: ""
        )
    }
    
}
