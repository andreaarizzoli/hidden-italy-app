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
}
