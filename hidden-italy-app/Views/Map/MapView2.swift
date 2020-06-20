//
//  MapView2.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 28/05/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView2: UIViewRepresentable {
    
    var latitude:Double = 40.8371
    var longitude:Double = 14.2467
    var regionRadius:Double = 1000000
    //
    ////    var monuments:Array = [
    ////        ["latitude": 40.8371, "longitude": 14.2467, "name":"monument 1"],
    ////        ["latitude": 41.8371, "longitude": 15.2467, "name":"monument 2"],
    ////        ["latitude": 42.8371, "longitude": 16.2467, "name":"monument 3"]
    ////    ]
    //
    func makeUIView(context:Context)->MKMapView{
        MKMapView(frame:.zero)
    }
    //
    func updateUIView(_ view:MKMapView, context:Context){
        //
        //    for monument in 0 ..< monuments.count {
        //         let coordinate3 = MKPointAnnotation()
        //        coordinate3.title = monument.name
        //        coordinate3.coordinate = CLLocationCoordinate2D(latitude: 39.8371, longitude: 13.2467)
        //       view.addAnnotation(coordinate3)
        //     }
        
        //        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)

        //        view.setRegion(MKCoordinateRegion(center: coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius),animated: true)
        //        let annotation = MKPointAnnotation()
        //        annotation.coordinate = coordinate
        //        annotation.title = "Questo è il titolo"
        //        annotation.subtitle = "Questo è il subtitle"
        //        view.addAnnotation(annotation)
        //
        //
        //        let coordinate2 = CLLocationCoordinate2D(latitude: 41.8371, longitude: 15.2467)
        //        view.setRegion(MKCoordinateRegion(center: coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius),animated: true)
        //        let annotation2 = MKPointAnnotation()
        //        annotation2.coordinate = coordinate2
        //        view.addAnnotation(annotation2)
        
        //        let coordinate3 = MKPointAnnotation()
        //        coordinate3.title = "coordinate 3"
        //        coordinate3.coordinate = CLLocationCoordinate2D(latitude: 39.8371, longitude: 13.2467)
        //        view.addAnnotation(coordinate3)
        
        
        
        //    func setPinUsingMKPointAnnotation(location: CLLocationCoordinate2D){
        //       let annotation = MKPointAnnotation()
        //       annotation.coordinate = location
        //       annotation.title = "Here"
        //       annotation.subtitle = "Device Location"
        //       let coordinateRegion = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 800, longitudinalMeters: 800)
        //       mapView2.setRegion(coordinateRegion, animated: true)
        //       mapView2.addAnnotation(annotation)
    }
}

struct MapView2_Previews: PreviewProvider {
    static var previews: some View {
        MapView2(
        )
    }
}
