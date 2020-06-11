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
    
    var body: some View {
        TabView {
            MapView()
                .tabItem{
                    Image(systemName: "magnifyingglass")
                    Text("Mappa")
                }
            
            MonumentListView2()
                .tabItem{
                    Image(systemName: "list.dash")
                    Text("Luoghi")
                }
            
            MapView2()
                .tabItem{
                    Image(systemName: "list.number")
                    Text("Classifica")
                }
            
            MonumentsView()
                .tabItem{
                    Image(systemName: "heart")
                    Text("Notifiche")
                }
            
            ExpandViewTest()
                .tabItem{
                    Image(systemName: "person")
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
