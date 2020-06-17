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
                        TextField("Nome", text: $name).modifier(FormTexFieldText())
                        Image(systemName: "person").modifier(FormTexFieldImage())
                    }.modifier(FormTexField())
                
                    HStack {
                        TextField("Cognome", text: $surname).modifier(FormTexFieldText())
                        Image(systemName: "person").modifier(FormTexFieldImage())
                    }.modifier(FormTexField())
                
                    HStack {
                        TextField("Email", text: $email).modifier(FormTexFieldText())
                        Image(systemName: "envelope").modifier(FormTexFieldImage())
                       }.modifier(FormTexField())
                    
                    HStack {
                        SecureField("Password", text:   $password).modifier(FormTexFieldText())
                        Image(systemName: "lock").modifier(FormTexFieldImage())
                    }.modifier(FormTexField())
                    
                    HStack {
                        SecureField("Ripeti la tua Password", text:     $r_password).modifier(FormTexFieldText())
                        Image(systemName: "lock").modifier(FormTexFieldImage())
                    }.modifier(FormTexField())
                    
                    Button(action: {self.nextView = "CreateUser"}){
                        Text("Crea utente")
                            .modifier(FormButtomText())
                    }.modifier(FormButtom())
                    
                    HStack{
                        Text("Hai già un account?")
                            .foregroundColor(Color.gray.opacity(0.5))
                        Button(action: {self.nextView = "LoginView"}) {
                            Text("Accedi")
                                .foregroundColor(Color(darkAccent))
                        }
                    }
                    
                    Spacer()
                    
                }.modifier(Form())
            }
        }
    }
}

struct CreateUserView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterUserView()
    }
}
