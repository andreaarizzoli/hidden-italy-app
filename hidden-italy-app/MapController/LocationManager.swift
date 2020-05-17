//
//  LocationManager.swift
//  hidden-italy-app
//
//  Created by user172259 on 07/05/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import Foundation
import MapKit

class LocationManager: NSObject, ObservableObject {
    
    private let locationManager = CLLocationManager()
    @Published var location: CLLocation? = nil  //CLLocationmmanager
    
//    @Published create observable objects that automatically announce when changes occur.
//    That means whenever an object with a property marked @Published is changed, all views using that object will be reloaded to reflect those         changes.
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.distanceFilter = kCLDistanceFilterNone
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
    
}

extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus){
//        print(status)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else{
            return
        }
        
        self.location = location
    }
    
}
