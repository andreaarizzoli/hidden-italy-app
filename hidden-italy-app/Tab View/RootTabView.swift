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
            
            MapView()
                .tabItem{
                    Image(systemName:"magnifyingglass")
                    Text("Mappa")
                }
            MonumentListView()
            .tabItem{
                Image(systemName:"list.dash")
                Text("Luoghi")
            }
            MapView()
            .tabItem{
                Image(systemName:"list.number")
                Text("Classifica")
            }
            MapView()
            .tabItem{
                Image(systemName:"heart")
                Text("Notifiche")
            }
            MapView()
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
