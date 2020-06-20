//
//  MonumentView.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 16/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI
import ValidatedPropertyKit


struct CreateMonumentView2: View {
    
    @ObservedObject var monuments = MonumentViewModel()
    @ObservedObject var categories = CategoryViewModel()
<<<<<<< HEAD
    @ObservedObject var creationMonument = CreateMonumentViewModel()

=======
    
    @ObservedObject private var creationMonument = CreateMonumentViewModel()
    
>>>>>>> fcca5235e3fbd9a36cae5e01e8d5adadf3f38484
    @Binding var showSheetMonumentView: Bool
    
    @State var image = UIImage()
    @State var selectedCategoryName = "Categoria"
    
    @State var isShowingImagePicker = false
    @State var isShowingOverlay = false
    @State var validateError = false
<<<<<<< HEAD
    @State var newImage = false

=======
    
    
    //    var disableForm: Bool {
    //        name.count < 1 && name.count < 50 ||
    //        description.count < 1 && description.count > 500 ||
    //        address.count < 1 && address.count > 100 ||
    //        number.count < 1 && number.count > 5 ||
    //        cap.count < 4 && cap.count > 6 ||
    //        city.count < 1 && city.count > 50
    //    }
    
>>>>>>> fcca5235e3fbd9a36cae5e01e8d5adadf3f38484
    var body: some View {
        
        ZStack {
            VStack {
                HStack {
<<<<<<< HEAD
                    
                    Spacer()
                        
=======
                    Spacer()
>>>>>>> fcca5235e3fbd9a36cae5e01e8d5adadf3f38484
                    Button(action: { self.showSheetMonumentView = false }){
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(Color(.gray))
                            .font(.system(size: 25))
                    }
                }.padding(.top, 15).padding(.trailing, 15)
                
                ScrollView{
                    VStack (alignment: .center, spacing:20){
                        
                        Button(action: {
                            self.isShowingImagePicker.toggle()
                        }){
                            ZStack (alignment: .center){
                                
                                Image(uiImage: image)
                                    .resizable()
                                    .frame(width:150, height:150)
                                    .clipShape(RoundedRectangle(cornerRadius: 35))
                                    .overlay(RoundedRectangle(cornerRadius: 35)
                                        .stroke(Color.gray, lineWidth: 1))
                                Image(systemName: "plus")
                                    .font(.system(size: 20))
                                    .foregroundColor(.gray)
                            }
                        }.buttonStyle(PlainButtonStyle())
                            .sheet(isPresented: $isShowingImagePicker, content: {
                                ImagePickerView(isPresented: self.$isShowingImagePicker, selectedImage: self.$image, newImage: self.$newImage)
                            })
                        
                        HStack {
                            TextField("Nome", text: self.$creationMonument.name.bound).modifier(FormTextFieldText())
                        }.modifier(FormTextField())
                        
                        HStack {
                            TextField("Descrizione", text: self.$creationMonument.description.bound).modifier(FormTextFieldText())
                        }.modifier(FormTextField())
                        
                        HStack {
                            TextField("Indirizzo", text: self.$creationMonument.address.bound).modifier(FormTextFieldText())
                        }.modifier(FormTextField())
                        
                        HStack {
                            HStack {
                                TextField("Numero", text: self.$creationMonument.number.bound).modifier(FormTextFieldText())
                            }.modifier(FormTextField())
                            
                            HStack {
                                TextField("CAP", text: self.$creationMonument.cap.bound).modifier(FormTextFieldText())
                            }.modifier(FormTextField())
                        }
                        
                        HStack {
                            TextField("Città", text: self.$creationMonument.city.bound).modifier(FormTextFieldText())
                        }.modifier(FormTextField())
                        
                        Button(action: {
                            self.isShowingOverlay = true
                        }) {
                            HStack {
<<<<<<< HEAD
                            Text("\(self.selectedCategoryName)").modifier(FormTextFieldText())
                            Spacer()
                            }.frame(maxWidth: .infinity).modifier(FormTextField())
                        }
                        
                        if (self.validateError == true && self.creationMonument.brokenRules.count >= 1) {
                            Text("Inserisci  \(self.creationMonument.brokenRules[0].propertyName).")
                            .modifier(ValidationErrorMessage())
                        }
                        
=======
                                Text("\(self.selectedCategoryName)").modifier(FormTextFieldText())
                                Spacer()
                                //Image(systemName: "circle").modifier(FormTextFieldImage())
                            }.frame(maxWidth: .infinity).modifier(FormTextField())
                        }
                        
>>>>>>> fcca5235e3fbd9a36cae5e01e8d5adadf3f38484
                        Button(action:  {
                            if (self.newImage) {self.creationMonument.image = 1}
                            self.creationMonument.validate()
                            self.validateError = true
<<<<<<< HEAD
                            if (self.creationMonument.validate()) {
                                print("inseriamo il monumento")
                            }
=======
                            //                            self.monuments.createMonument(
                            //                                name: self.name,
                            //                                description: self.description,
                            //                                address: self.address,
                            //                                number: self.number,
                            //                                cap: self.cap,
                            //                                city: self.city,
                            //                                category: self.selectedCategoryId,
                            //                                image: self.image
                            //                            )
                            //self.showSheetMonumentView = false
                            //print(self.image)
>>>>>>> fcca5235e3fbd9a36cae5e01e8d5adadf3f38484
                        }){
                            Text("Inserisci")
                                .modifier(FormButtonText())
                        }.modifier(FormButton())
<<<<<<< HEAD
                    
=======
                        //                            .disabled(disableForm)
                        
                        if (self.validateError) {
                            BrokenRulesView(brokenRules: self.creationMonument.brokenRules)
                        }
                        
>>>>>>> fcca5235e3fbd9a36cae5e01e8d5adadf3f38484
                        Spacer()
                        
                    }.modifier(Form())
                }
            }
            
            if (isShowingOverlay) {
                
                ZStack{
                    
                    VStack(alignment: .center) {
                        Text("")
                    }
                    .modifier(OverlayBackGround())
                    .onTapGesture(count: 1){self.isShowingOverlay = false}
                    
                    VStack(alignment: .center) {
                        
                        Spacer()
                        
                        List {
                            Text("Seleziona monumento").bold()
                            ForEach(categories.categoriesList) {item in
                                Button(action: {
                                    self.isShowingOverlay = false
                                    self.creationMonument.selectedCategoryId = item.id
                                    self.selectedCategoryName = item.description
<<<<<<< HEAD
=======
                                    
>>>>>>> fcca5235e3fbd9a36cae5e01e8d5adadf3f38484
                                }) {
                                    Text(item.description)
                                }
                            }
                        }.frame(height: 300).cornerRadius(35).padding(30)
                        
                        Spacer()
                        
                    }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                }
            }
        }.onAppear {
            self.categories.getCategories()
        }
    }
}


struct CreateMonumentView2_Previews: PreviewProvider {
    static var previews: some View {
        CreateMonumentView2(showSheetMonumentView: .constant(true))
    }
}

