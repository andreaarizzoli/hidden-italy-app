//
//  Landmark.swift
//  hidden-italy-app
//
//  Created by user172259 on 17/05/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import Foundation
import MapKit

struct Landmark {
    
    let placemark: MKPlacemark
    
    var id: UUID {
        return UUID()
    }
    
    var name: String {
        self.placemark.name ?? ""
    }
    
    //    var description: String {
    //           self.placemark.description ?? ""
    //    }
    
    var primaryCategory: String {
        self.placemark.title ?? ""
    }
    
    var coordinate: CLLocationCoordinate2D {
        self.placemark.coordinate
    }
}
