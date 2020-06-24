//
//  MapView.swift
//  hidden-italy-app
//
//  Created by user172259 on 07/05/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI
import MapKit

func a() {}

class CustomCoordinate: MKPointAnnotation {
    var monumentId: Int = 0
    
    var callback: () -> Void = a
}

struct Map: UIViewRepresentable {
    
    var view: MapView
    
    @Binding var monuments: [FindNearest]
    
    @EnvironmentObject var monumentsEnv: MonumentViewModel
    
    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView(frame: UIScreen.main.bounds)
        
        map.showsUserLocation = true
        map.delegate = context.coordinator
        map.userTrackingMode = .follow
        //map.pointOfInterestFilter = .some(MKPointOfInterestFilter(including: []))
        return map
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        for monument in monuments {
            let coordinate = CustomCoordinate()
            coordinate.title = monument.name
            coordinate.monumentId = monument.id
            coordinate.coordinate = CLLocationCoordinate2D(latitude: monument.lat, longitude: monument.lon)
            coordinate.callback = { self.changeId(id: monument.id) }
            
            uiView.addAnnotation(coordinate)
        }
    }
    
    func changeId(id: Int) {
        self.monumentsEnv.currentId = id
        self.monumentsEnv.show(id: id, view: self.view)
    }
}
