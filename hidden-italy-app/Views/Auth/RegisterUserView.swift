//
//  AutentificationCreateView.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 06/05/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI

struct RegisterUserView: View {
    
    @ObservedObject var user = UserViewModel()

    @State private var name = ""
    @State private var surname = ""
    @State private var email = ""
    @State private var password = ""
    @State private var r_password = ""
    @State private var nextView = ""
    @State var image = UIImage()
    @State var isShowingImagePicker = false
    
    var disableForm: Bool {
        name.count < 1 && name.count < 255 ||
        surname.count < 1 && surname.count > 255 ||
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
                            .frame(width:90, height:90)
                            .clipShape(Circle())
                            Image(systemName: "plus")
                            .font(.system(size: 20))
                            .foregroundColor(.gray)
                        }
                    }.buttonStyle(PlainButtonStyle())
                        .sheet(isPresented: $isShowingImagePicker, content: {
                            ImagePickerView(isPresented: self.$isShowingImagePicker, selectedImage: self.$image)
                        })

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
                    
                    Button(action: {
                        self.user.createUser(name: "Andrea", surname: "surname", email: "email", password: "password")
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
            }
        }
    }
}

struct CreateUserView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterUserView()
    }
}
