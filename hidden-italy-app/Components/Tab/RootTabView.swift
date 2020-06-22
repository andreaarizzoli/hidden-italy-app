//
//  RootTabView.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 04/05/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI

struct RootTabView: View {
    
    @ObservedObject var locationManager = LocationManager()
    
    init() {
//        UITabBar.appearance().backgroundColor = UIColor.blue
        UITabBar.appearance().barTintColor = BGColor
    }
    
    var body: some View {
        TabView {
            MapView()
                .tabItem{
                    Image(systemName: "map")
                    Text("Mappa")
            }
            
            MonumentListView()
                .tabItem{
                    Image(systemName: "list.dash")
                    Text("Luoghi")
            }
            
            MonumentListView2()
                .tabItem{
                    Image(systemName: "list.number")
                    Text("Classifica")
            }
            
            MonumentListView2()
                .tabItem{
                    Image(systemName: "heart")
                    Text("Notifiche")
            }
            
            ProfileView()
                .tabItem{
                    Image(systemName: "person")
                    Text("Profilo")
            }
            }.accentColor(Color(Accent)).modifier(PaddingSafeArea())
    }
    
}

struct RootTabView_Previews: PreviewProvider {
    static var previews: some View {
        RootTabView()
    }
}
