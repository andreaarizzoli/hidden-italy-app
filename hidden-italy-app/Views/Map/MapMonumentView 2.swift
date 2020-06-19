//
//  MapSingleMonumentView.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 10/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI
import MapKit

struct MapMonumentView: UIViewRepresentable {
    
    var latitude:Double
    var longitude:Double
    var regionRadius:Double
    
    func makeUIView(context:Context)->MKMapView{
        MKMapView(frame:.zero)
    }
    func updateUIView(_ view:MKMapView, context:Context){
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        view.setRegion(MKCoordinateRegion(center: coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius),animated: true)
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        view.addAnnotation(annotation)
    }
}
