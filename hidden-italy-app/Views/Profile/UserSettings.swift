//
//  userSettings.swift
//  hidden-italy-app
//
//  Created by user172259 on 17/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI

struct UserSettings: View {
    @Environment(\.presentationMode) var presentationMode

    @EnvironmentObject var user: UserViewModel

    @Binding var showSheetSettingsView: Bool
    
    var body: some View {
    
        ScrollView{
            VStack (alignment: .center, spacing:20){
                HStack {
                    Spacer()
                    Button(action: {
                        self.showSheetSettingsView = false
                    }){
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(Color(Accent))
                            .font(.system(size: 25))
                    }.modifier(ButtonCircle())
                }.padding(.top, 30)
                
                Button(action: {
                    self.showSheetSettingsView = false
                    self.user.logout()
                }) {
                    Text("Logout")
                }
                
            }.modifier(Form())
        }.modifier(BgSafearea())
    }
}

struct userSettings_Previews: PreviewProvider {
    static var previews: some View {
        UserSettings(
            showSheetSettingsView: .constant(true)
        )
    }
}
