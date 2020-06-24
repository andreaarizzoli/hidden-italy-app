//
//  MapView.swift
//  hidden-italy-app
//
//  Created by user172259 on 17/05/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI
import MapKit
import URLImage
import CoreImage

struct MapView: View {
    
    @ObservedObject var locationManager = LocationManager()
     
    @EnvironmentObject var sheetExpandable: SheetExpandable
    @EnvironmentObject var monuments: MonumentViewModel
    
    @State private var search: String = ""
    @State var showSheetMonumentView = false
    
    let ciContext = CIContext()
   
    @State var geo: GeometryProxy? = nil

    var body: some View {
        Group {
                ZStack(alignment: .top) {
                    Map(view: self, monuments: self.$monuments.monumentList)
                
                    HStack {
                        Image(systemName: "magnifyingglass").modifier(FormTextFieldImage())
                        
                        TextField(
                            "Search",
                            text: $search,
                            onEditingChanged: { _ in }){
                            
                            }.modifier(FormTextFieldText()
                        )
                        
                    }.modifier(FormTextField())
                     .padding(.horizontal, 30)
                     .padding(.top, 45).modifier(PaddingSafeArea())

                    GeoSheet(geo: self.$geo).modifier(PaddingSafeArea())
                }.modifier(BgSafearea())
                 .onAppear { self.monuments.getNearMonuments() }
                
                
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
