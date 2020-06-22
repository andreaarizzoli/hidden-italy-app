//
//  MonumentView.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 16/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI
//import ValidatedPropertyKit


struct CreateMonumentView: View {
    
    @ObservedObject var monuments = MonumentViewModel()
    @ObservedObject var categories = CategoryViewModel()
    
    @Binding var showSheetMonumentView: Bool
    
    //    @Validated(.isLowercased)
    //    var name: String?
    
    @State var name = ""
    @State var description = ""
    @State var address = ""
    @State var number = ""
    @State var cap = ""
    @State var city = ""
    @State var selectedCategoryName = "Categoria"
    @State var selectedCategoryId = 0
    
    @State var image = UIImage()
    @State var isShowingImagePicker = false
    @State var isShowingOverlay = false
    @State var newImage = false

//    var disableForm: Bool {
//        name.count < 1 && name.count < 50 ||
//        description.count < 1 && description.count > 500 ||
//        address.count < 1 && address.count > 100 ||
//        number.count < 1 && number.count > 5 ||
//        cap.count < 4 && cap.count > 6 ||
//        city.count < 1 && city.count > 50
//    }
    
    var body: some View {
        
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    Button(action: { self.showSheetMonumentView = false }){
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(Color(Accent))
//                            .foregroundColor(Color(.gray))
                            .font(.system(size: 25))
                    }.modifier(ButtonCircle())
                }.padding(.top, 15).padding(.trailing, 15)
                
                ScrollView{
                    VStack (alignment: .center, spacing:20){
                        
                        Button(action: { self.isShowingImagePicker.toggle() }) {
                            
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
                            ImagePickerView(
                                isPresented: self.$isShowingImagePicker,
                                selectedImage: self.$image, newImage: self.$newImage)
                            })
                        
                        HStack {
                            TextField("Nome", text: $name).modifier(FormTextFieldText())
                            //Image(systemName: "circle").modifier(FormTextFieldImage())
                        }.modifier(FormTextField())
                        
                        HStack {
                            TextField("Descrizione", text: $description).modifier(FormTextFieldText())
                            //Image(systemName: "circle").modifier(FormTextFieldImage())
                        }.modifier(FormTextField())
                        
                        HStack {
                            TextField("Indirizzo", text: $address).modifier(FormTextFieldText())
                            //Image(systemName: "circle").modifier(FormTextFieldImage())
                        }.modifier(FormTextField())
                        
                        HStack {
                            HStack {
                                TextField("Numero", text: $number).modifier(FormTextFieldText())
                                //Image(systemName: "circle").modifier(FormTextFieldImage())
                            }.modifier(FormTextField())
                            
                            HStack {
                                TextField("CAP", text: $cap).modifier(FormTextFieldText())
                                //Image(systemName: "circle").modifier(FormTextFieldImage())
                            }.modifier(FormTextField())
                        }
                        
                        HStack {
                            TextField("Città", text: $city).modifier(FormTextFieldText())
                            //Image(systemName: "circle").modifier(FormTextFieldImage())
                        }.modifier(FormTextField())
                        
                        Button(action: { withAnimation(.interactiveSpring()){self.isShowingOverlay = true} }) {
                            HStack {
                                Text("\(self.selectedCategoryName)").modifier(FormTextFieldText())
                                Spacer()
                                //Image(systemName: "circle").modifier(FormTextFieldImage())
                            }.frame(maxWidth: .infinity).modifier(FormTextField())
                        }
                        
                        Button(action:  {
                            self.monuments.createMonument(
                                name: self.name,
                                description: self.description,
                                address: self.address,
                                number: self.number,
                                cap: self.cap,
                                city: self.city,
                                category: self.selectedCategoryId,
                                image: self.image
                            )
                            self.showSheetMonumentView = false
                            print(self.image)
                        }){
                            Text("Inserisci")
                                .modifier(FormButtonText())
                        }.modifier(FormButton())
                        //.disabled(disableForm)
                        
                        Spacer()
                        
                    }.modifier(Form())
                }
            }
            
            if (isShowingOverlay) {
                ZStack{
                    VStack(alignment: .center) {
                        Text("")
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                    .background(Color (.black)
                    .opacity(0.5))
                    .onTapGesture(count: 1){self.isShowingOverlay = false}
                    
                    VStack(alignment: .center) {
                        
                        Spacer()
                        List {
                            Text("Seleziona monumento").bold()
                            ForEach(categories.categoriesList) {item in
                                Button(action: {
                                    self.isShowingOverlay = false
                                    self.selectedCategoryId = item.id
                                    self.selectedCategoryName = item.description
                                    
                                }) {
                                    Text(item.description)
                                }
                            }
                        }.frame(height: 300).cornerRadius(35).padding(30)
                        
                        Spacer()
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                }
            }
        }.modifier(BgSafearea())
         .onAppear { self.categories.getCategories() }
         
    }
}


struct CreateMonumentView_Previews: PreviewProvider {
    static var previews: some View {
        CreateMonumentView(showSheetMonumentView: .constant(true))
    }
}

