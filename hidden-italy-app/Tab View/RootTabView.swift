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
                    Image(systemName:"magnifyingglass")
                    Text("Mappa")
                }
            ResetUserView()
            .tabItem{
                Image(systemName:"list.dash")
                Text("Luoghi")
            }
            CreateUserView()
            .tabItem{
                Image(systemName:"list.number")
                Text("Classifica")
            }
            LoginView()
            .tabItem{
                Image(systemName:"heart")
                Text("Notifiche")
            }
            LoginView()
            .tabItem{
                Image(systemName:"person")
                Text("Profilo")
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
