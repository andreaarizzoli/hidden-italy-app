//
//  MonumentController.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 14/05/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import Foundation
import Alamofire
import Combine
import CoreLocation

class MonumentViewModel: ObservableObject {
    
    @Published var monumentList = [Monument]()
    @Published var userCoordinates = LocationManager()
    
    func getNearMonuments() {

        getAll(
            uri: Endpoints.Monuments.findNearest,
            body: FindNearest(
                lat: 45.4641684,
                lon: 9.1916211
            ),
            model: Monument.self,
            success: {res in
                self.monumentList = res as! [Monument]
            }
        )
    }
    
    func createMonument(
        name: String,
        description: String,
        address: String,
        number: String,
        cap: String,
        city: String,
        category: Int,
        image: UIImage
    ) -> Void {
        let coordinate = findCoordinates(address: address, number: number, city: city, cap: cap)

        let parameters: [String: Any] = [
            "name": name,
            "description": description,
            "lat": address,
            "lon": address,
            "user_id": "1",
            "main_category_id": category,
            "categories": "2",
        ]
    }
    
    func findCoordinates(address: String, number: String, city: String, cap: String) -> CLGeocoder {
        
        let geocoder = CLGeocoder()
        
        geocoder.geocodeAddressString(address + " " + city + " " + cap + " ") {
            placemarks, error in
            let placemark = placemarks?.first
            let lat = placemark?.location?.coordinate.latitude
            let lon = placemark?.location?.coordinate.longitude
            print("Lat: \(String(describing: lat)), Lon: \(String(describing: lon))")
        }
        
        return geocoder
    }
}


