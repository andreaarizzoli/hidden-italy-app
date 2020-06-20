//
//  CreateMonumentViewModel.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 19/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import Foundation
import ValidatedPropertyKit

class ValidateMonumentViewModel: ObservableObject {
    
    @Published private(set) var brokenRules = [BrokenRule]()
    
    @Validated(.nonEmpty)
    var name: String? = ""
    
    @Validated(.nonEmpty)
    var description :String? = ""
    
    @Validated(.nonEmpty)
    var address :String? = ""
    
    @Validated(.nonEmpty)
    var number :String? = ""
    
    @Validated(.nonEmpty && .isNumeric && .range(4...5))
    var cap :String? = ""
    
    @Validated(.nonEmpty)
    var city :String? = ""
    
    @Validated(.greater(0))
    var selectedCategoryId :Int?
    
    @Validated(.greater(0))
    var image :Int?
    
    func validate() -> Bool {

        self.brokenRules.removeAll()
                
        let rules = [
            "il nome": _name.validationError,
            "la descrizione": _description.validationError,
            "l'indirizzo": _address.validationError,
            "il numero": _number.validationError,
            "il CAP": _cap.validationError,
            "la città": _city.validationError,
            "la categoria": _selectedCategoryId.validationError,
            "l'immagine": _image.validationError,

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
            //
        }
    }
}
