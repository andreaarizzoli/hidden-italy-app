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
    
    struct parameters : Codable {
        var lat: Double = 45.4641684
        var lon: Double = 9.1916211
    }
        
    func getMonuments() {
        
//        AF.request(self.apiUrl ,method: .get).responseJSON { response in
//
//            switch response.result {
//            case .success(_):
//                do {
//                    let jsonDecoder  = JSONDecoder()
//                    let decode = try jsonDecoder.decode([Monument].self, from: response.data!)
//                    self.monumentList = decode
//                    //                    print("Converted JSON in struct \(self.monumentList)")
//                }
//                catch {
//                    print("Error reading JSON file: \(error.localizedDescription) Error description: \(error)")
//                }
//            case .failure(let error):
//                print(error)
//            }
//        }
    }
    
    func getNearMonuments() {
        
//        AF.request(self.apiUrl + "find-nearest" ,method: .get, parameters: parameters()).responseJSON { response in
//                        print(response)
//            print("trovato\(self.userCoordinates)")
//
//            switch response.result {
//            case .success(_):
//                do {
//                    let jsonDecoder  = JSONDecoder()
//                    let decode = try jsonDecoder.decode([Monument].self, from: response.data!)
//                    self.monumentList = decode
//                    print("Converted JSON in struct \(self.monumentList)")
//                }
//                catch {
//                    print("Error reading JSON file: \(error.localizedDescription) Error description: \(error)")
//                }
//            case .failure(let error):
//                print(error)
//            }
//        }

        getAll(uri: "/v1/monuments/find-nearest", body: parameters(), model: Monument.self, success: {res in
            self.monumentList = res as! [Monument]
        })
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


