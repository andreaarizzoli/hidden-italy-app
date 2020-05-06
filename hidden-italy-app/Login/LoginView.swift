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
        VStack()
        {
            if (nextView == "createUser") {
                CreateUserView()
            } else if (nextView == "resetUser") {
                ResetUserView()
            } else if (nextView == "login"){
                MapView()
            }
        
            Text("HIDDEN ITALY")
            .font(.largeTitle)
                .padding([.top,.bottom], 20)
            
            Spacer()
                    
            Text("Log In")
                .font(.largeTitle)
                //.padding([.top,.bottom], 20)
            
            Spacer()
            
            VStack(alignment: .leading){
                
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
                }
                
                HStack{
                    
                    Spacer()
                    
                    Button(action: {
                        self.nextView = "resetUser"
                        
                    }) {
                        Text("Hai dimenticato la password?")
                            .foregroundColor(Color.gray.opacity(0.5))
                        .padding(.top, 15)
                        
                    }
                }

            }.padding(.horizontal, 20)
           
            Button(action:  {
                self.nextView = "login"
            }){
                //
                Text("Log In")
                    .foregroundColor(.white)
                    .frame(width:UIScreen.main.bounds.width - 120)
                    .padding()
            }.background(Color("btnBg"))
            .clipShape(Capsule())
                .padding(.top, 35)
                   
            Text("oppure").foregroundColor(Color.gray.opacity(0.5)).padding([.top,.bottom], 10)
            
            HStack{
                
                Button(action: {
                    
                }){
                    Image("google")
                    .resizable()
                    .frame(width: 50.0, height: 50)
                    
                }
                
                Button(action: {
                    
                }){
                    Image("facebook")
                    .resizable()
                    .frame(width: 50.0, height: 50)
                    .padding()
                }
                
            }.padding([.top,.bottom], 15)
            
            HStack(spacing: 8){
                Text("Non hai un account?").foregroundColor(Color.gray.opacity(0.5))
                
                Button(action: {
                    self.nextView = "createUser"
                }) {
                    Text("Registrati")
                        .foregroundColor(.blue)
                }
            }.padding([.top,.bottom], 10)
        }
         
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
