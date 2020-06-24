//
//  MapCoordinator.swift
//  hidden-italy-app
//
//  Created by user172259 on 07/05/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import Foundation
import MapKit

final class Coordinator: NSObject, MKMapViewDelegate{
    var control: Map
    
    init(_ control: Map) {
        self.control = control
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
          if let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "bla") {
              annotationView.annotation = annotation
              return annotationView
          } else {
                let annotationView = MKPinAnnotationView(annotation:annotation, reuseIdentifier: "bla")
                annotationView.isEnabled = true
                annotationView.canShowCallout = true
            
                let btn = UIButton(type: .infoLight)
                
                annotationView.rightCalloutAccessoryView = btn
            
                return annotationView
          }
    }
    
    // When user taps on the disclosure button you can perform a segue to navigate to another view controller
    func mapView(_ mapView: MKMapView!, annotationView view: MKAnnotationView!, calloutAccessoryControlTapped control: UIControl!) {

        if control == view.rightCalloutAccessoryView{
            let c = view.annotation as! CustomCoordinate
            c.callback()
            
            //Perform a segue here to navigate to another viewcontroller
            // On tapping the disclosure button you will get here
        }
    }
    
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
        if let annotationView = views.first{
            if let annotation = annotationView.annotation {
                if annotation is MKUserLocation {
                    let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
                    mapView.setRegion(region, animated: true)
                }
            }
        }
    }
}
