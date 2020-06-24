//
//  AutentificationCreateView.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 06/05/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI

struct RegisterUserView: View {
    
    @EnvironmentObject var user: UserViewModel
    
    @State private var nextView = ""
    @State var image = UIImage()
    @State var isShowingImagePicker = false
    @State var newImage = false
    
    var disableForm: Bool {
        user.newUser.firstname.count < 1 && user.newUser.firstname.count < 255 ||
        user.newUser.lastname.count < 1 && user.newUser.lastname.count > 255 ||
        user.newUser.email.count < 1 && user.newUser.email.count > 255 ||
        user.newUser.password.count < 1 && user.newUser.password.count > 255 ||
        user.newUser.password != user.newUser.password_confirmation
    }
    
    var body: some View {
        
        VStack {
            if (nextView == "LoginView") {
                LoginView()
            }
                
            else if(nextView == "CreateUser"){
                LoginView()
            }
                
            else {
                
                VStack (alignment: .center, spacing:20){
                    
                    Spacer()
                    
                    Input(
                        icon: "person",
                        placeholder: "Nome",
                        value: $user.newUser.firstname
                    )
                    
                    Input(
                        icon: "person",
                        placeholder: "Cognome",
                        value: $user.newUser.lastname
                    )
                    
                    Input(
                        icon: "envelope",
                        placeholder: "Email",
                        type: .email,
                        value: $user.newUser.email
                    )
                    
                    Input(
                        icon: "lock",
                        placeholder: "Nome",
                        type: .password,
                        value: $user.newUser.password
                    )
                    
                    Input(
                        icon: "lock",
                        placeholder: "Ripeti password",
                        type: .password,
                        value: $user.newUser.password_confirmation
                    )
    
                    Button(action: {
                        self.user.register()
                    }){
                        Text("Crea utente")
                            .modifier(FormButtonText())
                    }.modifier(FormButton()).disabled(disableForm)
                    
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
                 .modifier(BgSafearea())
                 .modifier(AdaptsToSoftwareKeyboard())
                 .onTapGesture{hideKeyboard()}
            }
        }
    }
}

struct CreateUserView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterUserView()
    }
}
