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
    
    @Published var monumentList = [FindNearest]()
    @Published var userCoordinates = LocationManager()
    @Published var testMonument = Monument(
        id: 1,
        name: "Duomo di Milano",
        description: "blablabal",
        lat: 00,
        lon: 00,
        visible: true,
        user_id: 1,
        category_id: 1,
        category: Category(
            id: 1,
            description: "",
            created_at: "",
            updated_at: ""
        ),
        distance: 1.1,
        created_at: "sjodjifs",
        updated_at: "blabla",
        categories: [],
        images: [ImageModel(
            id: 0,
            title: "",
            description: "",
            url: "",
            monument_id: 0,
            user_id: 0,
            created_at: "",
            updated_at: ""
        )],
        comments: []
    )
    
    func getNearMonuments() {

        getAll(
            uri: endpoint(.findNearestMonuments),
            body: FindNearestBody(
                lat: 45.4641684,
                lon: 9.1916211
            ),
            model: FindNearest.self,
            success: {res in
                self.monumentList = res as! [FindNearest]
            }
        )
    }
    
    func create(name: String, description: String, address: String, number: String, cap: String, city: String, category: Int, image: UIImage) {
        
        let coordinate = findCoordinates(address: address, number: number, city: city, cap: cap)
        
        print("coordinate: \(coordinate)")
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
    
    func show(id: Int, view: MonumentListView, geo: GeometryProxy) -> Void {
        get(
            uri: Endpoints.showMonument(id: id),
            body: EmptyBody(),
            model: Monument.self,
            success: {res in
                let monument = res as! Monument
                
                let x = geo.frame(in: .global).minX
                let y = geo.frame(in: .global).minY
                let thisRect = CGRect(x: x, y: y, width: view.SVWidth, height: view.itemHeight)
                view.expandedScreen_returnPoint = thisRect
                view.expandedScreen_startPoint =  thisRect

                Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false) { (timer) in
                    view.expandedScreen_shown = true
                    view.expandedScreen_startPoint =  CGRect(x: 0, y: 0, width:UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
                }
                
                view.monuments.testMonument = monument
            }
        )
    }
}


