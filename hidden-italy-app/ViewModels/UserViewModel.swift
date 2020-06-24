//
//  UserViewModel.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 18/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import Foundation
import Alamofire
import Combine
import SwiftUI

class UserViewModel: ObservableObject {
    
    /**
     * Struct used during login flow.
     *
     * @author Daniele Tulone <danieletulone.work@gmail.com>
     */
    @Published var newLogin = LoginBody(email: "", password: "")
    
    @Published var newUser = RegisterBody()
    
    @Published var logged: Bool = UserViewModel.getToken() == "" ? false : true
    
    @Published var monumentVisited = [MonumentUser]()

    
    /**
     * The field name in which store token.
     *
     * @author Daniele Tulone <danieletulone.work@gmail.com>
     */
    private static var tokenName = "token"
    
    /**
     * Get the token.
     *
     * @author Daniele Tulone <danieletulone.work@gmail.com>
     */
    func getToken() -> String {
        return String(
            UserDefaults.standard.string(forKey: UserViewModel.tokenName) ?? ""
        )
    }
    
    /**
     * Get the token.
     *
     * @author Daniele Tulone <danieletulone.work@gmail.com>
     */
    static func getToken() -> String {
        return String(
            UserDefaults.standard.string(forKey: UserViewModel.tokenName) ?? ""
        )
    }

    /**
     * Send login request to api and obtain token.
     *
     * @author Daniele Tulone <danieletulone.work@gmail.com>
     */
    func login(callback: @escaping (Any?) -> Void = {res in }) -> Void {
        post(
            uri: endpoint(.login),
            body: LoginBody(
                email: self.newLogin.email,
                password: self.newLogin.password
            ),
            model: Login.self,
            success: {res in
                let response = res as! Login

                UserViewModel.setApiToken(token: response.token)
                
                self.logged = true
                
                callback(res)
            }
        )
    }
    
    func logout() -> Void {
        post(
            uri: endpoint(.revoke),
            body: EmptyBody(),
            model: Revoke.self,
            success: {res in
                
                let data = res as! Revoke
                
                if (data.revoked) {
                    UserViewModel.setApiToken(token: "")
                    self.logged = false
                }
            }
        )
    }
    
    func visitedMonument() -> Void {
        get(uri: endpoint(.userMonument),
            body: EmptyBody(),
            model: MonumentUser.self,
            success: {res in
                self.monumentVisited = res as! [MonumentUser]
            })
    }
    
    func register() -> Void {
        post(
            uri: endpoint(.register),
            body: self.newUser,
            model: Register.self,
            success: {res in
                self.newLogin.email = self.newUser.email
                self.newLogin.password = self.newUser.password
                self.login()
            }
        )
    }
    
    /**
     * Set the token.
     *
     * @author Daniele Tulone <danieletulone.work@gmail.com>
     */
    static func setApiToken(token: String) -> Void {
        UserDefaults.standard.set(token, forKey: UserViewModel.tokenName)
    }
}
