//
//  UserTabs.swift
//  hidden-italy-app
//
//  Created by user172259 on 18/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI

struct UserTabsOld: View {
    @State var index = 0
        
    var body: some View {
        VStack{
            HStack(){
    //               Spacer()
                Button(action: { self.index = 0 }){
                    VStack{
                        
                        if self.index != 0 {
                            
                            Image(systemName:"map").modifier(Icon())
                            Capsule()
                            .fill(Color .white)
                            .frame(width: 80, height: 6)
                            .padding(.top)
                                
                        } else {
                            Image(systemName:"map.fill").modifier(Icon())
                            Capsule()
                            .fill(Color(darkAccent))
                            .frame(width: 80, height: 6)
                            .padding(.top)
                            
    //                           Text("Monumenti").foregroundColor(Color.black.opacity(0.7))
                        }
                    }
                }
                
    //               Spacer(minLength: 20)
                
                Button(action: { self.index = 1 }){
                    VStack{
                        if self.index != 1 {
                            Image(systemName:"gift").modifier(Icon())
                            Capsule()
                            .fill(Color .white)
                            .frame(width: 80, height: 6)
                            .padding(.top)
                        } else {
                            Image(systemName:"gift.fill").modifier(Icon())
                            Capsule()
                            .fill(Color(darkAccent))
                            .frame(width: 80, height: 6)
                            .padding(.top)
                                
    //                           Text("Premi").foregroundColor(Color.black.opacity(0.7))
                        }
                    }
                }.padding(.leading, 30)
                    .padding(.trailing, 30)
    //               Spacer(minLength: 20)
                
                Button(action: { self.index = 2 }){
                    VStack{
                        if self.index != 2 {
                            Image(systemName:"star").modifier(Icon())
                            Capsule()
                                .fill(Color .white)
                                .frame(width: 80, height: 6)
                                .padding(.top)
                            
                        } else {
                            Image(systemName:"star.fill").modifier(Icon())
                            
                            Capsule()
                            .fill(Color(darkAccent))
                            .frame(width: 80, height: 6)
                            .padding(.top)
                            
    //                           .padding()
    //                           .background(Color(bgColor))
    //                           .clipShape(Circle())
    //                               .offset(y: -30)
    //                               .padding(.bottom, -20)
                            
    //                           Text("Punteggio").foregroundColor(Color.black.opacity(0.7))
                        }
                    }
                }
                
            }.padding(.vertical, 10)
                
                .animation(.linear(duration: 0.25))
    //               .animation(.spring(response: 0.2, dampingFraction: 0.3, blendDuration: 0.4))
    //           .overlay(
    //           RoundedRectangle(cornerRadius: 40)
    //               .stroke(Color(bgColor), lineWidth: 5)).padding(.horizontal, 30)
                
                
            
            if (index == 0) {
                VisitedMonuments()
            } else if (index == 1) {
                Prizes()
            } else if (index == 2) {
                ProfileScore()
            }
            
        }
    }
}


struct UserTabsOld_Previews: PreviewProvider {
    static var previews: some View {
        UserTabsOld()
    }
}

