//
//  AutentificationCreateView.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 06/05/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI

struct RegisterUserView: View {
    
    @State private var name = ""
    @State private var surname = ""
    @State private var email = ""
    @State private var password = ""
    @State private var r_password = ""
    @State private var nextView = ""

    var body: some View {
        
        VStack{
            if (nextView == "LoginView") {
                LoginView()
            }
        
            else if(nextView == "CreateUser"){
                // Da Creare
            }

            else {
                
                VStack (alignment: .center, spacing:20){

                    Image("phImage")
                        .resizable().frame(width:90, height:90)
                        .clipShape(Circle())
                        .padding(25)

                    HStack {
                        TextField("Nome", text: $name).foregroundColor(.gray)
                        Image(systemName: "person").foregroundColor(.gray).padding(4)
                    }.padding(15)
                    .overlay(RoundedRectangle(cornerRadius:        35).stroke(Color.gray, lineWidth: 1))
                
                    HStack {
                        TextField("Cognome", text: $surname).foregroundColor(.gray)
                        Image(systemName: "person").foregroundColor(.gray).padding(4)
                    }.padding(15)
                    .overlay(RoundedRectangle(cornerRadius:        35).stroke(Color.gray, lineWidth: 1))
                
                    HStack {
                        TextField("Email", text: $email).foregroundColor(.gray)
                        Image(systemName: "envelope").foregroundColor(.gray).padding(2)
                       }.padding(15)
                       .overlay(RoundedRectangle(cornerRadius:  35).stroke(Color.gray, lineWidth: 1))
                    
                    HStack {
                        SecureField("Password", text:   $password).foregroundColor(.gray)
                        Image(systemName: "lock").foregroundColor(.gray).padding(6)
                        
                    }.padding(15)
                    .overlay(RoundedRectangle(cornerRadius: 35).stroke(Color.gray,  lineWidth: 1))
                    
                    HStack {
                        SecureField("Ripeti la tua Password", text:     $r_password).foregroundColor(.gray)
                        Image(systemName: "lock").foregroundColor(.gray).padding(6)
                    }.padding(15)
                    .overlay(RoundedRectangle(cornerRadius: 35).stroke(Color.gray,  lineWidth: 1))
                    
                    Button(action: {self.nextView = "CreateUser"}){
                        Text("Crea utente")
                            .foregroundColor(.white)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding(15)
                            .background(Color(bgColor))
                            .clipShape(Capsule())
                    }
                    
                    HStack{
                        Text("Hai già un account?")
                            .foregroundColor(Color.gray.opacity(0.5))
                    
                        Button(action: {self.nextView = "LoginView"}) {
                            Text("Accedi")
                                .foregroundColor(Color(darkAccent))
                        }
                    }
                    
                    Spacer()
                    
                }.padding(.horizontal, 30).padding(.bottom)
            }
        }
    }
}

struct CreateUserView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterUserView()
    }
}
