//
//  AutentificationLoginView.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 06/05/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var user = UserViewModel()
    
    @State private var email = ""
    @State private var password = ""
    @State private var nextView = ""
    
    var disableForm: Bool {
        email.count < 1 && email.count < 255 ||
            password.count < 1 && password.count > 255
    }
    
    var body: some View {
        
        VStack() {
            if (nextView == "logged") {
                RootTabView()
            }
            else if (nextView == "resetUser"){
                //                ResetView()
                AlertXView()
            }
            else if (nextView == "registerUser"){
                RegisterUserView()
            }
            else {
                
                VStack (alignment: .center, spacing:20){
                    Spacer()
                    Image("logo").resizable().frame(width:109, height:89)
                    
                    Spacer()
                    
                    HStack {
                        TextField("Email", text: $email).modifier(FormTextFieldText())
                        Image(systemName: "envelope").modifier(FormTextFieldImage())
                    }.modifier(FormTextField())
                    
                    HStack {
                        SecureField("Password", text: $password).modifier(FormTextFieldText())
                        Image(systemName: "lock").modifier(FormTextFieldImage())
                    }.modifier(FormTextField())
                    
                    HStack(){
                        Spacer()
                        Button(action: {self.nextView = "resetUser"}) {
                            Text("Hai dimenticato la password?")
                                .modifier(LoginText())
                        }
                    }
                    
                    Button(action:  {
                        self.nextView = "logged"
                    }){
                        Text("Log In")
                            .modifier(FormButtonText())
                    }.modifier(FormButton()).disabled(disableForm)
                    
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
                    
                    HStack{
                        Button(action: {    }){
                            Image("google")
                                .resizable()
                                .frame(width: 35.0, height: 35)
                        }.padding(.trailing)
                        
                        Button(action: {    }){
                            Image("facebook")
                                .resizable()
                                .frame(width: 35.0, height: 35)
                        }.padding(.leading)
                    }
                    
                    Spacer()
                    
                }.modifier(Form())
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
