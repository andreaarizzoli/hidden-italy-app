//
//  MapView.swift
//  hidden-italy-app
//
//  Created by user172259 on 07/05/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI
import MapKit

struct Map: UIViewRepresentable {
    
    @Binding var monuments: [Monument]
    
    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView(frame: UIScreen.main.bounds)
        
        map.showsUserLocation = true
        map.delegate = context.coordinator
        map.userTrackingMode = .follow
        //    map.mapType = .mutedStandard
        //map.pointOfInterestFilter = .some(MKPointOfInterestFilter(including: []))        
        return map
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        for monument in monuments {
            //print("entrato")
            let coordinate = MKPointAnnotation()
            coordinate.title = monument.name
            coordinate.subtitle = monument.description
            coordinate.coordinate = CLLocationCoordinate2D(latitude: monument.lat, longitude: monument.lon)
            uiView.addAnnotation(coordinate)
        }
    }
}

//struct Map_Previews: PreviewProvider {
//    static var previews: some View {
//        Map()
//    }
//}
