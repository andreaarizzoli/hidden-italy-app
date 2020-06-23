//
//  UserTest.swift
//  hidden-italy-app
//
//  Created by user172259 on 19/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI

struct UserTab: View {
    
    @State var index = 1
    @State var offset : CGFloat = UIScreen.main.bounds.width
    var width = UIScreen.main.bounds.width
    
    var body: some View{
        
        VStack(spacing: 0){
            
            AppBar(index: self.$index, offset: self.$offset)
            
            GeometryReader{g in
                
                HStack(spacing: 0){
                    
                    VisitedMonuments()
                        .frame(width: g.frame(in : .global).width)
                    
                    Prizes()
                        .frame(width: g.frame(in : .global).width)
                    
                    ProfileScore()
                        .frame(width: g.frame(in : .global).width)
                }
                .offset(x: self.offset)
                .highPriorityGesture(DragGesture()
                    
                .onEnded({ (value) in
                    
                    if value.translation.width > 50{
                        
                        print("right")
                        self.changeView(left: false)
                    }
                    if -value.translation.width > 50{
                        
                        print("left")
                        self.changeView(left: true)
                    }
                }))
            }
        }.background(Color(BGColor)).edgesIgnoringSafeArea(.top)
        //        .animation(.linear)
        //        .edgesIgnoringSafeArea(.all)
    }
    
    func changeView(left : Bool){
        
        if left{
            
            if self.index != 3{
                
                self.index += 1
            }
        }
        else{
            
            if self.index != 1{
                
                self.index -= 1
            }
        }
        
        if self.index == 1{
            
            self.offset = self.width
        }
        else if self.index == 2{
            
            self.offset = 0
        }
        else{
            
            self.offset = -self.width
        }
    }
}


struct AppBar : View {
    
    @Binding var index : Int
    @Binding var offset : CGFloat
    var width = UIScreen.main.bounds.width
    
    var body: some View{
        
        VStack(alignment: .leading, content: {
            
            HStack{
                
                Button(action: {
                    
                    self.index = 1
                    self.offset = self.width
                }) {
                    
                    VStack(spacing: 8){
                        
                        HStack(spacing: 12){
                            
                            if self.index == 1  {
                                Image(systemName:"map.fill").foregroundColor(Color(Accent)).modifier(Icon())
                            } else{
                                Image(systemName:"map").foregroundColor(Color(Accent)).modifier(Icon())
                            }
                            Text("Visitati")
                                .foregroundColor(Color(Accent))
                        }.padding(.bottom, 10)
                        
                        Capsule().fill(self.index == 1 ? Color(Accent) : Color.clear)
                            .frame(height: 4)
                    }
                }
                
                Button(action: {
                    
                    self.index = 2
                    self.offset = 0
                    
                }) {
                    
                    VStack(spacing: 8){
                        
                        HStack(spacing: 12){
                            
                            if self.index == 2  {
                                Image(systemName:"gift.fill").foregroundColor(Color(Accent)).modifier(Icon())
                            } else{
                                Image(systemName:"gift").foregroundColor(Color(Accent)).modifier(Icon())
                            }
                            Text("Premi").foregroundColor(Color(Accent))
                        }.padding(.bottom, 10)
                        
                        Capsule().fill(self.index == 2 ? Color(Accent) : Color.clear)
                            .frame(height: 4)
                    }
                }
                
                Button(action: {
                    
                    self.index = 3
                    self.offset = -self.width
                    
                }) {
                    
                    VStack(spacing: 8){
                        
                        HStack(spacing: 12){
                            
                            if self.index == 3  {
                                Image(systemName:"star.fill").foregroundColor(Color(Accent)).modifier(Icon())
                            } else{
                                Image(systemName:"star").foregroundColor(Color(Accent)).modifier(Icon())
                            }
                            Text("Punti").foregroundColor(Color(Accent))
                        }.padding(.bottom, 10)
                        
                        Capsule().fill(self.index == 3 ? Color(Accent) : Color.clear)
                            .frame(height: 4)
                    }
                }
            }
        })
            .modifier(PaddingSafeArea())
            .padding(.horizontal)
            .padding(.bottom, 10)
    }
}

struct UserTab_Previews: PreviewProvider {
    static var previews: some View {
        UserTab()
    }
}
