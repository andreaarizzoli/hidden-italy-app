//
//  SheetMap.swift
//  hidden-italy-app
//
//  Created by Daniele Tulone on 24/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import Foundation
import SwiftUI
import URLImage

struct SheetMap: View {
    @EnvironmentObject var monuments: MonumentViewModel
    @EnvironmentObject var sheetExpandable: SheetExpandable
    
    var body: some View {
        MapMonumentView(latitude: self.monuments.testMonument.lat, longitude: self.monuments.testMonument.lon, regionRadius: 350)
            .cornerRadius(35)
            .frame(height: 250)
            .padding(.horizontal, 30)
            .modifier(Shadow())
            .padding(.bottom, 60)
    }
}
