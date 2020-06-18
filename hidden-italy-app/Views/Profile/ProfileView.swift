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
                HStack {
//                Text("Ciao").modifier(FormTextFieldText())
                ProfileTab()
                }
                
            }
        }
    }
}



struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

struct ProfileTab: View {
    
        @State var index = 0
    
    var body: some View {
        VStack{
            
            HStack{
                
                Button(action: {
                    self.index = 0
                
                }){
                    
                    VStack{
                        
                        if self.index != 0 {
                            
                            Image(systemName:"magnifyingglass")
                                //.rezizable()
                                //.frame(width: 25, height: 25)
                                .foregroundColor(Color.black.opacity(0.2))
                        } else {
                            Image(systemName:"magnifyingglass").foregroundColor(.white)
                                
                            .padding()
                                .background(Color("btnBg"))
                            .clipShape(Circle())
                                .offset(y: -20)
                                .padding(.bottom, -20)
                            
                            Text("Mappa").foregroundColor(Color.black.opacity(0.7))
                        }
                    }
                }
                
                Spacer(minLength: 15)
                
                Button(action: {
                    
                    self.index = 1
                    
                }){
                    VStack{
                        if self.index != 1 {
                            Image(systemName:"star").foregroundColor(Color.black.opacity(0.2))
                        } else {
                            Image(systemName:"star.fill").foregroundColor(.white)
                            .padding()
                                .background(Color("btnBg"))
                            .clipShape(Circle())
                                .offset(y: -20)
                                .padding(.bottom, -20)
                            
                            Text("Luoghi").foregroundColor(Color.black.opacity(0.7))
                        }
                    }
                }
                Spacer(minLength: 15)
                
                Button(action: {
                    
                    self.index = 2

                }){
                    VStack{
                        if self.index != 2 {
                            Image(systemName:"list.number").foregroundColor(Color.black.opacity(0.2))
                        } else {
                            Image(systemName:"list.number").foregroundColor(.white)
                            .padding()
                                .background(Color("btnBg"))
                            .clipShape(Circle())
                                .offset(y: -20)
                                .padding(.bottom, -20)
                            
                            Text("Classifica").foregroundColor(Color.black.opacity(0.7))
                        }
                    }
                }
                Spacer(minLength: 15)
                
            }.padding(.vertical, 10)
                .padding(.horizontal, 20)
                .background(Color .white)
                .animation(.spring())
            
            if (index == 0) {
                LoginView()
            } else if (index == 1) {
                LoginView()
            } else if (index == 2) {
                LoginView()
            }
            
        }
        
        
    }
    
}
