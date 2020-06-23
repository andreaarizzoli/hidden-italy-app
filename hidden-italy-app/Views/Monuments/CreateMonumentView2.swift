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
    @ObservedObject var creationMonument = ValidationMonument()

    @Binding var showSheetMonumentView: Bool
    @Binding var showAlertMonument: Bool
    
    @State var image = UIImage()
    @State var selectedCategoryName = "Categoria"
    @State var selectedCategoryId: Int = 0
    
    @State var isShowingImagePicker = false
    @State var isShowingOverlay = false
    @State var validateError = false
    @State var newImage = false
    var characterLimitDescription: Int = 800


//    init() {
//        UITableView.appearance().separatorStyle = .none
//        UITableViewCell.appearance().backgroundColor = .green
//        UITableView.appearance().backgroundColor = .green
//    }

    var body: some View {
        
        ZStack {
            VStack {
                HStack {
                    
                    Spacer()

                    Button(action: { self.showSheetMonumentView = false }){
                        Image(systemName: "xmark.circle.fill")
                            .modifier(ButtonExit())
                           
                    }.modifier(ButtonCircle())
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
                                    .modifier(AddImage())
                                Image(systemName: "plus")
                                    .font(.system(size: 35))
                                    .foregroundColor(Color(Accent))
                            }
                        }.buttonStyle(PlainButtonStyle())
                            .sheet(isPresented: $isShowingImagePicker, content: {
                                ImagePickerView(isPresented: self.$isShowingImagePicker,
                                                selectedImage: self.$image,
                                                newImage: self.$newImage)
                            })
                        
                        HStack {
                            TextField("Nome", text: self.$creationMonument.name.bound)
                                .modifier(FormTextFieldText())
                        }.modifier(FormTextField())
                        
                        HStack {
                            TextView(placeholderText: "Descrizione",
                                     text: self.$creationMonument.description.bound,
                                     limit: self.characterLimitDescription, size: 17,
                                     weightFont: .regular).frame(numLines: 4)
                            .padding()
                        }.modifier(AddImage())
                        
                        HStack {
                            TextField("Indirizzo", text: self.$creationMonument.address.bound)
                                .modifier(FormTextFieldText())
                        }.modifier(FormTextField())
                        
                        HStack {
                            HStack {
                                TextField("Numero", text: self.$creationMonument.number.bound)
                                    .modifier(FormTextFieldText())
                            }.modifier(FormTextField())
                            
                            HStack {
                                TextField("CAP", text: self.$creationMonument.cap.bound)
                                    .modifier(FormTextFieldText())
                            }.modifier(FormTextField())
                        }
                        
                        HStack {
                            TextField("Città", text: self.$creationMonument.city.bound)
                                .modifier(FormTextFieldText())
                        }.modifier(FormTextField())
                        
                        Button(action: {
                            self.isShowingOverlay = true
                        }) {
                            HStack {
                            Text("\(self.selectedCategoryName)").modifier(FormTextFieldText())
                            Spacer()
                            }.frame(maxWidth: .infinity).modifier(FormTextField())
                        }
                        
                        if (self.validateError == true && self.creationMonument.brokenRules.count >= 1) {
                            Text("Inserisci  \(self.creationMonument.brokenRules[0].propertyName).")
                            .modifier(ValidationErrorMessage())
                            .onAppear(perform: {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                    withAnimation {
                                        self.validateError = false
                                    }
                                }
                            })
                        }
                        
                        Button(action:  {
                            if (self.newImage) {self.creationMonument.image = 1}
                            self.validateError = true
                            if (self.creationMonument.validate()) {
                                self.monuments.create(name: self.creationMonument.name.bound,
                                                      description: self.creationMonument.description.bound,
                                                      address: self.creationMonument.address.bound,
                                                      number: self.creationMonument.number.bound,
                                                      cap: self.creationMonument.cap.bound,
                                                      city: self.creationMonument.city.bound,
                                                      category: self.selectedCategoryId,
                                                      image: self.image)
                                self.showAlertMonument = true
                                print("inseriamo il monumento")
                                self.showSheetMonumentView = false
                            }
                        }){
                            Text("Inserisci")
                                .modifier(FormButtonText())
                        }.modifier(FormButton())

                        Spacer()
                        
                    }.modifier(Form()).padding(.top)
                }
            }
            
            if (isShowingOverlay) {
                
                ZStack{
                    
                    VStack(alignment: .center) {
                        Text("")
                    }
                    .modifier(OverlayBackground())
                    .onTapGesture(count: 1){self.isShowingOverlay = false}
                    
                    VStack(alignment: .center) {
                        
                        Spacer()
                        
                        List {
                            Text("Seleziona monumento").bold()
                            ForEach(categories.categoriesList) {item in
                                Button(action: {
                                    self.isShowingOverlay = false
                                    self.creationMonument.selectedCategoryId = item.id
                                    self.selectedCategoryId = item.id
                                    self.selectedCategoryName = item.description
                                }) {
                                    Text(item.description)
                                }
                            }
                        }.frame(height: 300).cornerRadius(35).padding(30).colorMultiply(Color(BGColor)).padding(.top)
                        
                        Spacer()
                        
                    }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                }
            }
        }.modifier(BgSafearea())
         .onAppear { self.categories.getCategories() }
    }
}


struct CreateMonumentView2_Previews: PreviewProvider {
    static var previews: some View {
        CreateMonumentView2(showSheetMonumentView: .constant(true), showAlertMonument: .constant(false))
    }
}

