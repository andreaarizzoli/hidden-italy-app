//
//  RootTabView.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 04/05/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI

struct RootTabView: View {
    
    @EnvironmentObject var user: UserViewModel

    @ObservedObject var locationManager = LocationManager()
    
    init() {
        UITabBar.appearance().barTintColor = BGColor
    }
    
    var body: some View {
        Group {
            if (user.logged == true) {
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
            } else {
                LoginView().environmentObject(user)
            }            
        }
    }
    
}

struct RootTabView_Previews: PreviewProvider {
    static var previews: some View {
        RootTabView()
    }
}
