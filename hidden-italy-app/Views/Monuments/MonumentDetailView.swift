//
//  MonumentView.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 07/05/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI

struct MonumentDetailView: View {
    
    var body: some View {
        
        VStack{
            ScrollView{
            ZStack(alignment: .bottom){
                Image("duomoComment")
                .resizable()
//                .aspectRatio(contentMode: .fit)
                .frame(height: 250)
                
                Rectangle()
                    .frame(height: 80)
                    .opacity(0.30)
                    .blur(radius: 10)
                
                HStack{
                    VStack(alignment: .leading, spacing: 8){
                        Text("Duomo di Milano")
                        .font(.largeTitle)
                        .foregroundColor(Color.white)
                    }
                    .padding(Edge.Set.leading, 30)
                    .padding(.bottom)
                    Spacer()
                }

            }.listRowInsets(EdgeInsets())
        VStack(alignment: .leading, spacing: 8){
           
            
            Text("Questa è una descrizione test per il monumento. ")
            .multilineTextAlignment(.leading)
            .lineSpacing(8)
            .padding(Edge.Set.leading, 30)
            .padding(Edge.Set.trailing, 30)
            .padding(.top)
            
           
            CommentListView().lineLimit(nil)
                .frame(height: 400)

            
            }
            }}.edgesIgnoringSafeArea(.top)
        .navigationBarHidden(true)
        }
}

struct MonumentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MonumentDetailView()
    }
}
