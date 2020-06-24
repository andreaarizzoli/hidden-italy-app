//
//  AutentificationLoginView.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 06/05/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var user: UserViewModel
    
    @State private var nextView: String = ""
    
    var disableForm: Bool {
        user.newLogin.email.count < 1 && user.newLogin.email.count < 255 ||
        user.newLogin.password.count < 1 && user.newLogin.password.count > 255
    }
    
    var body: some View {
        
        VStack() {
            if (nextView == "logged" || self.user.getToken() != "") {
                RootTabView().environmentObject(user)
            } else if (nextView == "registerUser") {
                RegisterUserView()
            } else {
                
                VStack (
                    alignment: .center,
                    spacing:20
                ) {
                    
                    Image("logo")
                        .resizable()
                        .frame(width:109, height:89)
                        .padding(.vertical, 200)
                                        
                    Input(
                        icon: "envelope",
                        placeholder: "Email",
                        type: .email,
                        value: $user.newLogin.email
                    )
                    
                    Input(
                        icon: "lock",
                        placeholder: "Password",
                        type: .password,
                        value: $user.newLogin.password
                    )
                    
                    Button(
                        action:  {                            
                            self.user.login(callback: {res in
                                 self.nextView = "logged"
                            })
                        }
                    ) {
                        Text("Log In")
                            .modifier(FormButtonText())
                    }.modifier(FormButton())
                        .disabled(disableForm)
                    
                    HStack(){
                        Text("Non hai un account?")
                            .modifier(LoginText())
                        Button(action: {
                            self.nextView = "registerUser"
                        }) {
                            Text("Registrati")
                                .foregroundColor(Color(darkAccent))
                        }
                    }
                    
                    Spacer()
                    
                }.modifier(Form())
                 .modifier(BgSafearea())
                 .onTapGesture { hideKeyboard() }
                 .modifier(AdaptsToSoftwareKeyboard())
            }
        }.modifier(BgSafearea())
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
