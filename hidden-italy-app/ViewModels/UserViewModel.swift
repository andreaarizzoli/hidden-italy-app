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

class UserViewModel: ObservableObject {
    
    /**
     * Struct used during login flow.
     *
     * @author Daniele Tulone <danieletulone.work@gmail.com>
     */
    @Published var newLogin = LoginBody(email: "", password: "")
    
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
    func login(callback: @escaping (Any?) -> Void) -> Void {
        post(
            uri: "/v1/auth/login",
            body: LoginBody(
                email: self.newLogin.email,
                password: self.newLogin.password
            ),
            model: Login.self,
            success: {res in
                let response = res as! Login

                self.setApiToken(token: response.token)
                
                callback(res)
            }
        )
    }
    
    /**
     * Set the token.
     *
     * @author Daniele Tulone <danieletulone.work@gmail.com>
     */
    func setApiToken(token: String) -> Void {
        UserDefaults.standard.set(token, forKey: UserViewModel.tokenName)
    }
}
