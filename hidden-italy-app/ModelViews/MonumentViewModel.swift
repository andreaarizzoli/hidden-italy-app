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
    
    let parameters = [
        "lat": "45.4641684",
        "lon": " 9.1916211"
    ]
    
    private var apiUrl = "http://127.0.0.1:8000/api/monuments"
    
    func getMonuments() {
        
        AF.request(self.apiUrl ,method: .get).responseJSON { response in
            
            switch response.result {
            case .success(_):
                do {
                    let jsonDecoder  = JSONDecoder()
                    let decode = try jsonDecoder.decode([Monument].self, from: response.data!)
                    self.monumentList = decode
                    //                    print("Converted JSON in struct \(self.monumentList)")
                }
                catch {
                    print("Error reading JSON file: \(error.localizedDescription) Error description: \(error)")
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getNearMonuments() {
        
        AF.request(self.apiUrl + "/findNearest" ,method: .post, parameters:parameters, encoding: JSONEncoding.default).responseJSON { response in
            //            print(response)
            print("trovato\(self.userCoordinates)")
            
            switch response.result {
            case .success(_):
                do {
                    let jsonDecoder  = JSONDecoder()
                    let decode = try jsonDecoder.decode([Monument].self, from: response.data!)
                    self.monumentList = decode
                    print("Converted JSON in struct \(self.monumentList)")
                }
                catch {
                    print("Error reading JSON file: \(error.localizedDescription) Error description: \(error)")
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func createMonument(name: String, description: String, address: String, number: String, cap: String, city: String, category: Int, image: UIImage){
        
        let coordinate = findCoordinates(address: address, number: number, city: city, cap: cap)
        
        let parameters = [
            "name": name,
            "description": description,
            "lat": address,
            "lon": address,
            "user_id": "1",
            "main_category_id": category,
            //            "url": ???,
            "categories": "2",
            ] as [String : Any]
    }
    
    func shortDescription(description: String){
        //description.stringByPaddingToLength(3, withString: "", startingAtIndex: 0)
        // var response = "blablabla"
        // return response
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


