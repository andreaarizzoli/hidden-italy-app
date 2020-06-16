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
                    TextField("Nome", text: $name).foregroundColor(.gray)
                    Image(systemName: "person").foregroundColor(.gray).padding(4)
                }.padding(15)
                .overlay(RoundedRectangle(cornerRadius: 35).stroke(Color.gray, lineWidth: 1))
                
                HStack {
                    TextField("Descrizione", text: $description).foregroundColor(.gray)
                    Image(systemName: "person").foregroundColor(.gray).padding(4)
                }.padding(15)
                .overlay(RoundedRectangle(cornerRadius: 35).stroke(Color.gray, lineWidth: 1))
                
                HStack {
                    
                    HStack {
                        TextField("Latitudine", text: $latitude).foregroundColor(.gray)
                        Image(systemName: "person").foregroundColor(.gray).padding(4)
                    }.padding(15)
                    .overlay(RoundedRectangle(cornerRadius: 35).stroke(Color.gray, lineWidth: 1))
                    
                    HStack {
                        TextField("Longitudine", text: $longitude).foregroundColor(.gray)
                        Image(systemName: "person").foregroundColor(.gray).padding(4)
                    }.padding(15)
                    .overlay(RoundedRectangle(cornerRadius: 35).stroke(Color.gray, lineWidth: 1))
                }
                
                HStack {
                    TextField("Category", text: $category).foregroundColor(.gray)
                    Image(systemName: "person").foregroundColor(.gray).padding(4)
                }.padding(15)
                .overlay(RoundedRectangle(cornerRadius: 35).stroke(Color.gray, lineWidth: 1))
                
                Button(action:  {
                }){
                    Text("Log In")
                        .foregroundColor(.white)
    //                            .fontWeight(.bold)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                }
                     .background(Color(bgColor))
    //                    .background(LinearGradient(gradient: Gradient(colors:                     [Color(lightAccent), Color(darkAccent)]), startPoint:                       .top, endPoint: .bottom))
                .clipShape(Capsule())

                Spacer()
            
            
            
            }.padding(.horizontal, 30).padding(.bottom)
            
        }
    }
}


struct CreateMonumentView_Previews: PreviewProvider {
    static var previews: some View {
        CreateMonumentView(showSheetMonumentView: .constant(true))
    }
}
