//
//  MapView.swift
//  hidden-italy-app
//
//  Created by user172259 on 17/05/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @ObservedObject var locationManager = LocationManager()
    @State private var search:String = ""
    @ObservedObject var monuments = MonumentViewModel()
    
    var body: some View {
        ZStack(alignment: .top){
            Map(monuments: self.$monuments.monumentList)
            
            
            HStack {
                Image(systemName: "magnifyingglass").modifier(FormTextFieldImage())
                TextField("Search", text: $search, onEditingChanged: { _ in }){
                    
                }.modifier(FormTextFieldText())
                
            }.modifier(FormTextField())
             .padding(.horizontal, 30)
             .padding(.top, 45).modifier(PaddingSafeArea())

            }.modifier(BgSafearea())
             .onAppear { self.monuments.getNearMonuments() }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
