//
//  AutentificationCreateView.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 06/05/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI

struct CreateUserView: View {
    
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var r_password = ""
    @State private var createUser = false

    var body: some View {
        
        VStack{
            if createUser {
                LoginView()
            }
            
            Spacer()
            Text("Log In")
                .font(.largeTitle)
            
            Spacer()
            
            Image("logo")
            .resizable()
            .frame(width: 100, height: 100)
            .clipShape(Circle())
                .padding(.bottom, 10)
            
            
            VStack{
                
                VStack(alignment: .leading){
                    
                    Text("Nome")
                        .font(.headline).fontWeight(.light).foregroundColor(Color.init(.label).opacity(0.75))
                        
                    TextField("Inerisci il tuo nome", text: $name)
                    
                    Divider()
                }.padding(.bottom, 15)
                
                VStack(alignment: .leading){
                    
                    Text("Email").font(.headline).fontWeight(.light).foregroundColor(Color.init(.label).opacity(0.75))
                    
                    TextField("Inserisci la tua email", text: $email)
                    
                    Divider()
                    
                }.padding(.bottom, 15)
                
                VStack(alignment: .leading){
                    
                    Text("Password")
                        .font(.headline).fontWeight(.light).foregroundColor(Color.init(.label).opacity(0.75))
                        
                    SecureField("Inerisci la tua Password", text: $password)
                    
                    Divider()
                }.padding(.bottom, 15)
                
                VStack(alignment: .leading){
                    
                    Text("Ripeti Password")
                        .font(.headline).fontWeight(.light).foregroundColor(Color.init(.label).opacity(0.75))
                        
                    SecureField("Ripeti la tua Password", text: $r_password)
                    
                    Divider()
                }
            }.padding(.horizontal, 20)
            
            Spacer()
            Button(action:  {
                self.createUser = true
            }){
                Text("Crea utente")
                    .foregroundColor(.white)
                    .frame(width:UIScreen.main.bounds.width - 120)
                    .padding()
            }.background(Color("btnBg"))
            .clipShape(Capsule())
                
            Spacer()
            
            HStack(spacing: 8){
                Text("Hai già un account?").foregroundColor(Color.gray.opacity(0.5))
                
                Button(action: {
                   
                }) {
                    Text("Accedi")
                        .foregroundColor(.blue)
                }
            }.padding([.top,.bottom], 10)
        }
    }
}

struct CreateUserView_Previews: PreviewProvider {
    static var previews: some View {
        CreateUserView()
    }
}
