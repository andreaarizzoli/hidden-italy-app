//
//  userSettings.swift
//  hidden-italy-app
//
//  Created by user172259 on 17/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI

struct userSettings: View {
    
    @Binding var showSheetSettingsView: Bool
    
    var body: some View {
        
        
        ScrollView{
        VStack (alignment: .center, spacing:20){
            HStack {
            Spacer()
                Button(action: { self.showSheetSettingsView = false }){
                    Image(systemName: "xmark.circle.fill")
                    .foregroundColor(Color(.gray))
                    .font(.system(size: 25))
                }
            }.padding(.top, 30)
            
            
            }.modifier(Form())
        }
    }
}

struct userSettings_Previews: PreviewProvider {
    static var previews: some View {
        userSettings(showSheetSettingsView: .constant(true))
    }
}
