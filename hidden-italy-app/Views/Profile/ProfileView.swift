//
//  PofileView.swift
//  hidden-italy-app
//
//  Created by user172259 on 17/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    
    @State var showSheetSettingsView = false
    
    var body: some View {
        
        ScrollView{
            
            HStack (alignment: .center){
                Spacer()
                VStack(alignment: .leading){
                        Button(action: {
                        self.showSheetSettingsView.toggle()
                        }) {
                        Image(systemName: "gear")
                        .foregroundColor(Color(bgColor))
                        .font(.system(size: 30))
                    }.sheet(isPresented: $showSheetSettingsView ) {
                        userSettings(showSheetSettingsView: self.$showSheetSettingsView)
                    }
                }
                
            }.padding(.horizontal, 30).padding(.top, 30)
        
                
            VStack (alignment: .center, spacing:20){
                Image("phImage")
                    .resizable().frame(width:90, height:90)
                    .clipShape(Circle())
                    .padding()
                
                Text("Ciao Nome Utente").modifier(FormTextFieldText())
                    .font(.system(size: 24))
                    .padding(.bottom)
                
                UserTabs()
                
            }
        }
    }
}



struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}


