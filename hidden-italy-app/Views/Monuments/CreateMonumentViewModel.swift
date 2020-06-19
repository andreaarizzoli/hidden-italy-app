//
//  CreateMonumentViewModel.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 19/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import Foundation
import ValidatedPropertyKit

class CreateMonumentViewModel: ObservableObject {
    
//    @Published private(set) var brokenRules = [BrokenRule]()
    @Published private(set) var brokenRules = [BrokenRule]()

    @Validated(.nonEmpty)
    var name: String? = ""
    
    @Validated(.nonEmpty)
    var description :String? = ""
    
    @Validated(.nonEmpty)
    var address :String? = ""
    
    @Validated(.nonEmpty)
    var number :String? = ""
    
    @Validated(.nonEmpty)
    var cap :String? = ""
    
    @Validated(.nonEmpty)
    var city :String? = ""
    
//    var selectedCategoryId :Int = 0
//    var image = UIImage()
    
    private func validate() -> Bool {

        self.brokenRules.removeAll()
                
        let rules = [
            "nome": _name.validationError,
            "descrizione": _description.validationError,
            "indirizzo": _address.validationError,
            "numero": _number.validationError,
            "CAP": _cap.validationError,
            "città": _city.validationError
        ]
        
        _ = rules.compactMap { pair in
            guard let errorMessage = pair.1?.failureReason else {
                return
            }
            self.brokenRules.append(BrokenRule(propertyName: pair.0, message: "\(pair.0) \(errorMessage)"))
        }
        
        return self.brokenRules.count == 0
    }
    
    func createMonument() {
        if self.validate(){
            print("Creo il monument")
        } else {
            print("Non creo il monument")
        }
    }
}
