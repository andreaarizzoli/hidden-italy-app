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
                        TextField("Nome", text: $name).modifier(FormTextFieldText())
                        Image(systemName: "person").modifier(FormTextFieldImage())
                    }.modifier(FormTextField())
                
                    HStack {
                        TextField("Cognome", text: $surname).modifier(FormTextFieldText())
                        Image(systemName: "person").modifier(FormTextFieldImage())
                    }.modifier(FormTextField())
                
                    HStack {
                        TextField("Email", text: $email).modifier(FormTextFieldText())
                        Image(systemName: "envelope").modifier(FormTextFieldImage())
                       }.modifier(FormTextField())
                    
                    HStack {
                        SecureField("Password", text:   $password).modifier(FormTextFieldText())
                        Image(systemName: "lock").modifier(FormTextFieldImage())
                    }.modifier(FormTextField())
                    
                    HStack {
                        SecureField("Ripeti la tua Password", text:     $r_password).modifier(FormTextFieldText())
                        Image(systemName: "lock").modifier(FormTextFieldImage())
                    }.modifier(FormTextField())
                    
                    Button(action: {self.nextView = "CreateUser"}){
                        Text("Crea utente")
                            .modifier(FormButtonText())
                    }.modifier(FormButton())
                    
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
