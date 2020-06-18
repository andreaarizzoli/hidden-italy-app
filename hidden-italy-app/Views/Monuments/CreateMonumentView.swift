//
//  MonumentView.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 16/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI

struct CreateMonumentView: View {
    
    @ObservedObject var monuments = MonumentViewModel()
    @Binding var showSheetMonumentView: Bool
    @State private var name = ""
    @State private var description = ""
    @State private var address = ""
    @State private var number = ""
    @State private var cap = ""
    @State private var city = ""
    @State private var category = ""
    @State var image = UIImage()
    @State var isShowingImagePicker = false

    var disableForm: Bool {
        name.count < 1 && name.count < 50 ||
        description.count < 1 && description.count > 500 ||
        address.count < 1 && address.count > 100 ||
        number.count < 1 && number.count > 5 ||
        cap.count < 4 && cap.count > 6 ||
        city.count < 1 && city.count > 50
    }
    
    var body: some View {
        
        VStack {
            HStack {
            Spacer()
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
                            ImagePickerView(isPresented: self.$isShowingImagePicker, selectedImage: self.$image)
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
                    
                    HStack {
                        TextField("Category", text: $category).modifier(FormTextFieldText())
                        //Image(systemName: "circle").modifier(FormTextFieldImage())
                    }.modifier(FormTextField())
                    
                    Button(action:  {
                        self.monuments.createMonument(
                            name: self.name,
                            description: self.description,
                            address: self.address,
                            number: self.number,
                            cap: self.cap,
                            city: self.city,
                            category: self.category,
                            image: self.image
                        )
                        self.showSheetMonumentView = false
                        print(self.image)
                    }){
                        Text("Inserisci")
                            .modifier(FormButtonText())
                    }.modifier(FormButton()).disabled(disableForm)
                    
                    Spacer()
                    
                    }.modifier(Form())
            }
        }
    }
}


struct CreateMonumentView_Previews: PreviewProvider {
    static var previews: some View {
        CreateMonumentView(showSheetMonumentView: .constant(true))
    }
}

//struct DummyView: UIViewRepresentable{
//
//    func makeUIView(context: UIViewRepresentableContext<DummyView>) -> UIButton {
//        let button = UIButton()
//        button.setTitle("DUMMY", for: .normal)
//        return button
//    }
//
//    func updateUIView(_ uiView: DummyView.UIViewType, context: UIViewRepresentableContext<DummyView>) {
//    }
//}
