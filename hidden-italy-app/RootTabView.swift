//
//  RootTabView.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 04/05/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI

struct RootTabView: View {
    var body: some View {
        TabView{
            
            LoginView()
                .tabItem{
                    Image(systemName:"cart")
                    Text("Buy/Sell")
                }
            ResetUserView()
            .tabItem{
                Image(systemName:"gear")
                Text("Gear")
            }
            CreateUserView()
            .tabItem{
                Image(systemName:"bandage")
                Text("Hospital")
            }
            LoginView()
            .tabItem{
                Image(systemName:"dollarsign.circle")
                Text("Bank")
            }
            LoginView()
            .tabItem{
                Image(systemName:"airplane")
                Text("Travel")
            }
        }
        .accentColor(Color .blue)
    }
    
}

struct RootTabView_Previews: PreviewProvider {
    static var previews: some View {
        RootTabView()
    }
}
