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
    
    @State private var firstname = ""
    @State private var lastname = ""
    @State private var email = ""
    @State private var password = ""
    @State private var r_password = ""
    @State private var nextView = ""
    @State var image = UIImage()
    @State var isShowingImagePicker = false
    @State var newImage = false
    
    var disableForm: Bool {
        firstname.count < 1 && firstname.count < 255 ||
        lastname.count < 1 && lastname.count > 255 ||
        email.count < 1 && email.count > 255 ||
        password.count < 1 && password.count > 255 ||
        r_password != password
    }
    
    var body: some View {
        
        VStack{
            if (nextView == "LoginView") {
                LoginView()
            }
                
            else if(nextView == "CreateUser"){
                LoginView()
            }
                
            else {
                
                VStack (alignment: .center, spacing:20){
                    
                    Spacer()
                    
                    Button(action: {
                        self.isShowingImagePicker.toggle()
                    }){
                        ZStack (alignment: .center){
                            
                            Image(uiImage: image)
                                .resizable()
                                .frame(width:125, height:125)
                                .clipShape(Circle()).modifier(AddImage())
                            Image(systemName: "plus")
                                .font(.system(size: 35))
                                .foregroundColor(Color(Accent))
                        }
                    }.buttonStyle(PlainButtonStyle())
                        .sheet(isPresented: $isShowingImagePicker, content: {
                            ImagePickerView(isPresented: self.$isShowingImagePicker, selectedImage: self.$image, newImage: self.$newImage)
                        })
                    
                    Input(
                        icon: "person",
                        placeholder: "Nome",
                        value: $firstname
                    )
                    
                    Input(
                        icon: "person",
                        placeholder: "Cognome",
                        value: $lastname
                    )
                    
                    Input(
                        icon: "envelope",
                        placeholder: "Email",
                        type: .email,
                        value: $email
                    )
                    
                    Input(
                        icon: "lock",
                        placeholder: "Nome",
                        type: .password,
                        value: $password
                    )
                    
                    Input(
                        icon: "lock",
                        placeholder: "Ripeti password",
                        type: .password,
                        value: $r_password
                    )
    
                    Button(action: {
//                        self.user.createUser(name: "Andrea", surname: "surname", email: "email", password: "password")
                        self.nextView = "CreateUser"
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
