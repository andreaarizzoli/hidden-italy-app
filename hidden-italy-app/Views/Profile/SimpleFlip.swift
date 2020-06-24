//
//  SimpleFlip.swift
//  hidden-italy-app
//
//  Created by user172259 on 24/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI

struct SimpleFlip: View {
    
    @State private var flipped = false
    @State private var animate3d = false
    
    var body: some View {
        
        return VStack {
            
            ZStack() {
                FrontCard().opacity(flipped ? 0.0 : 1.0)
                BackCard().opacity(flipped ? 1.0 : 0.0)
            }
            .modifier(FlipEffect(flipped: $flipped, angle: animate3d ? 180 : 0, axis: (x: 0, y: -1)))
            .onTapGesture {
                withAnimation(Animation.linear(duration: 0.35)) {
                    self.animate3d.toggle()
                }
            }
            
        }
    }
}


struct FrontCard : View {
    var body: some View {
        Image("duomo")
            .resizable()
            .frame(width: 150, height: 150, alignment: .center)
//            .foregroundColor(Color(BGColor))
            .clipShape(RoundedRectangle(cornerRadius: 35))
            .modifier(Shadow())

    }
}

struct BackCard : View {
    var body: some View {
        
        VStack{
            Text("Back card")
            
        }.frame(width: 150, height: 150)
         .background(Color(Accent))
            .clipShape(RoundedRectangle(cornerRadius: 35))
            .modifier(Shadow())
         .foregroundColor(Color.white)
            
        
    }
}


struct SimpleFlip_Previews: PreviewProvider {
    static var previews: some View {
        SimpleFlip()
    }
}
