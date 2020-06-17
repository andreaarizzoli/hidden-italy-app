//
//  AutentificationLoginView.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 06/05/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var nextView = ""

    var body: some View {
        
       VStack() {
            if (nextView == "logged") {
                RootTabView()
            }
            else if (nextView == "resetUser"){
//                ResetView()
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
                        TextField("Email", text: $email).modifier(FormTexFieldText())
                        Image(systemName: "envelope").modifier(FormTexFieldImage())
                    }.modifier(FormTexField())
                    
                    HStack {
                        SecureField("Password", text: $password).modifier(FormTexFieldText())
                        Image(systemName: "lock").modifier(FormTexFieldImage())
                    }.modifier(FormTexField())
                   
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
                            .modifier(FormButtomText())
                    }.modifier(FormButtom())
                    
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
