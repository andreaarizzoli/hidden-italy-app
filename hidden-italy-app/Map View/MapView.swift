//
//  MapView.swift
//  hidden-italy-app
//
//  Created by user172259 on 07/05/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
  
  var locationManager = CLLocationManager()
  func setupManager() {
//    locationManager.desiredAccuracy = kCLLocationAccuracyBest
//    locationManager.requestWhenInUseAuthorization()
//    locationManager.requestAlwaysAuthorization()
  }
  
    func makeUIView(context: Context) -> MKMapView {
    setupManager()
    let map = MKMapView(frame: UIScreen.main.bounds)
    map.showsUserLocation = true
    map.delegate = context.coordinator
    map.userTrackingMode = .follow
    return map
  }
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
  func updateUIView(_ uiView: MKMapView, context: Context) {
    
  }
}

struct Map_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}