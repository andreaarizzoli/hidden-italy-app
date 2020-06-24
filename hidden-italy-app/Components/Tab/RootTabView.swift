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
    @EnvironmentObject var sheetExpandable: SheetExpandable
    
    var logged: Bool {
        user.logged && user.getToken() != ""
    }
    
    @ObservedObject var locationManager = LocationManager()
    
    init() {
        UITabBar.appearance().barTintColor = BGColor
    }
    
    var body: some View {
        Group {
            if (self.logged == true) {
                TabView {
                    MapView()
                        .tabItem{
                            Image(systemName: "map")
                            Text("Mappa")
                    }.onAppear(perform: {
                        self.sheetExpandable.shown = false
                    })
                    
                    MonumentListView()
                        .tabItem{
                            Image(systemName: "list.dash")
                            Text("Luoghi")
                        }
                    
                    MonumentListView()
                        .tabItem{
                            Image(systemName: "list.number")
                            Text("Classifica")
                        }
                    
                    MonumentListView()
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
