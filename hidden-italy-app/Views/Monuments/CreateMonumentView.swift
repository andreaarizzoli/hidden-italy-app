//
//  MonumentView.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 16/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI

struct CreateMonumentView: View {
    @Binding var showSheetMonumentView: Bool
    @State private var name = ""
    @State private var description = ""
    @State private var latitude = ""
    @State private var longitude = ""
    @State private var category = ""
    
    @State private var selectedGenderIndex: Int = 0

    var body: some View {
        
        ScrollView{
            VStack (alignment: .center, spacing:20){
                HStack {
                Spacer()
                    Button(action: { self.showSheetMonumentView = false }){
                        Image(systemName: "xmark.circle.fill")
                        .foregroundColor(Color(.gray))
                        .font(.system(size: 25))
                    }
                }.padding(.top, 30)
                            
                Image("phImage")
                .resizable()
                .frame(width:150, height:150)
                .clipShape(RoundedRectangle(cornerRadius: 35))
                
                HStack {
                    TextField("Nome", text: $name).modifier(FormTexFieldText())
                    Image(systemName: "person").modifier(FormTexFieldImage())
                }.modifier(FormTexField())
                
                HStack {
                    TextField("Descrizione", text: $description).modifier(FormTexFieldText())
                    Image(systemName: "person").modifier(FormTexFieldImage())
                }.modifier(FormTexField())
                
                HStack {
                    HStack {
                        TextField("Latitudine", text: $latitude).modifier(FormTexFieldText())
                        Image(systemName: "person").modifier(FormTexFieldImage())
                    }.modifier(FormTexField())
                    
                    HStack {
                        TextField("Longitudine", text: $longitude).modifier(FormTexFieldText())
                        Image(systemName: "person").modifier(FormTexFieldImage())
                    }.modifier(FormTexField())
                }
                
                HStack {
                    TextField("Category", text: $category).modifier(FormTexFieldText())
                    Image(systemName: "person").modifier(FormTexFieldImage())
                }.modifier(FormTexField())
                
                Button(action:  {
                }){
                    Text("Inserisci")
                        .modifier(FormButtomText())
                }.modifier(FormButtom())
                
                Spacer()
                
                }.modifier(Form())
        }
    }
}


struct CreateMonumentView_Previews: PreviewProvider {
    static var previews: some View {
        CreateMonumentView(showSheetMonumentView: .constant(true))
    }
}
