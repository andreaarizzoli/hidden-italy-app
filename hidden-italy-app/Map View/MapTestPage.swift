//
//  MapTestPage.swift
//  hidden-italy-app
//
//  Created by user172259 on 07/05/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI

struct MapTestPage: View {
    private var locationManager = LocationManager()
    
    var body: some View {
       MapView()
        .edgesIgnoringSafeArea(.all)
    }
}

struct MapTestPage_Previews: PreviewProvider {
    static var previews: some View {
        MapTestPage()
    }
}
