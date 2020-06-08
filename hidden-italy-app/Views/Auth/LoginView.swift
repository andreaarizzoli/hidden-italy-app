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
//                    .animation()
//                    .transition()
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
                        TextField("Email", text: $email).foregroundColor(.gray)
                        Image(systemName: "envelope").foregroundColor(.gray).padding(2)
                    }.padding(15)
                    .overlay(RoundedRectangle(cornerRadius: 35).stroke(Color.gray, lineWidth: 1))
                    
                    HStack {
                        SecureField("Password", text: $password).foregroundColor(.gray)
                        Image(systemName: "lock").foregroundColor(.gray).padding(4)
                        
                    }.padding(15)
                    .overlay(RoundedRectangle(cornerRadius: 35).stroke(Color.gray, lineWidth: 1))
                   
                    HStack(){
                        Spacer()
                    
                        Button(action: {self.nextView = "resetUser"}) {
                            Text("Hai dimenticato la password?")
                                .foregroundColor(Color.gray.opacity(0.5))
                        }
                    }
                    
                    Button(action:  {
                        self.nextView = "logged"
                    }){
                        
                        Text("Log In")
                            .foregroundColor(.white)
//                            .fontWeight(.bold)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding()
                    }
                         .background(Color(bgColor))
//                    .background(LinearGradient(gradient: Gradient(colors:                     [Color(lightAccent), Color(darkAccent)]), startPoint:                       .top, endPoint: .bottom))
                    .clipShape(Capsule())
                    
                    HStack(){
                        Text("Non hai un account?")
                            .foregroundColor(Color.gray.opacity(0.5))
                        
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
                }.padding(.horizontal, 30).padding(.bottom)
                
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
