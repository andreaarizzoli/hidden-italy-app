//
//  CircleTab.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 07/05/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI

struct CircleTab: View {
    
    @State var index = 0
    
    var body: some View {
        
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
                        Image(systemName:"list.dash").foregroundColor(Color.black.opacity(0.2))
                    } else {
                        Image(systemName:"list.dash").foregroundColor(.white)
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
            
            Button(action: {
                
                self.index = 3
                
            }){
                VStack{
                    if self.index != 3 {
                        Image(systemName:"heart").foregroundColor(Color.black.opacity(0.2))
                    } else {
                        Image(systemName:"heart").foregroundColor(.white)
                        .padding()
                            .background(Color("btnBg"))
                        .clipShape(Circle())
                            .offset(y: -20)
                            .padding(.bottom, -20)
                        
                        Text("Notifiche").foregroundColor(Color.black.opacity(0.7))
                    }
                }
            }
            Spacer(minLength: 15)
            
            Button(action: {
                
                self.index = 4

            }){
                VStack{
                    if self.index != 4 {
                        Image(systemName:"person").foregroundColor(Color.black.opacity(0.2))
                    } else {
                        Image(systemName:"person").foregroundColor(.white)
                        .padding()
                            .background(Color("btnBg"))
                        .clipShape(Circle())
                            .offset(y: -20)
                            .padding(.bottom, -20)
                        
                        Text("Profilo").foregroundColor(Color.black.opacity(0.7))
                    }
                }
            }
                        
        }.padding(.vertical, 10)
            .padding(.horizontal, 20)
            .background(Color .white)
            .animation(.spring())
    }
}

struct CircleTab_Previews: PreviewProvider {
    static var previews: some View {
        CircleTab()
    }
}
