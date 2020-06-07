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
    @State private var loginView = false


    var body: some View {
        
        VStack() {
            if loginView {
                RootTabView()
                    .animation(.easeIn(duration: 1))
                    .transition(AnyTransition.opacity.combined(with: .slide))
            } else {
                
                VStack (alignment: .center, spacing: 30){
                    Spacer()
                    Image("logo").resizable().frame(width:109, height:89)
                    Spacer()
                
                    HStack {
                       Image(systemName: "person").foregroundColor(.gray)
                        TextField("Inserisci la tua email", text: $email).foregroundColor(.gray)
                    }.padding()
                    .overlay(RoundedRectangle(cornerRadius: 35).stroke(Color.gray, lineWidth: 1))
                    
                    HStack {
                       Image(systemName: "lock").foregroundColor(.gray)
                        SecureField("Inerisci la tua Password", text: $password).foregroundColor(.gray)
                    }.padding()
                    .overlay(RoundedRectangle(cornerRadius: 35).stroke(Color.gray, lineWidth: 1))
                   
                    HStack(){
                        Spacer()
                    
                        Button(action: {self.nextView = "resetUser"}) {
                            Text("Hai dimenticato la password?")
                                .foregroundColor(Color.gray.opacity(0.5))
                        }
                    }
                    
                    Button(action:  {
                        self.loginView = true
                    }){
                        
                        Text("Log In")
                            .foregroundColor(.white).fontWeight(.bold)
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
                            self.nextView = "createUser"
                        }) {
                            Text("Registrati")
                                .foregroundColor(Color(darkAccent))
                        }
                    }.padding(.bottom)
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
