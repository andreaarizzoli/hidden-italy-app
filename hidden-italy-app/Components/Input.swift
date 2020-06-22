//
//  Input.swift
//  hidden-italy-app
//
//  Created by Daniele Tulone on 22/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import Foundation
import SwiftUI

/**
 * Input element for forms.
 *
 * @author Daniele Tulone <danieletulone.work@gmail.com>
 */
struct Input: View {
    
    /**
     * The icon to show.
     *
     * @author Daniele Tulone <danieletulone.work@gmail.com>
     */
    var icon: String = ""
    
    /**
     * The text to use as placeholder.
     *
     * @author Daniele Tulone <danieletulone.work@gmail.com>
     */
    var placeholder: String
    
    /**
     * The type of input: text, email or password.
     *
     * @author Daniele Tulone <danieletulone.work@gmail.com>
     */
    var type: String = "text"
    
    /**
     * The value of input that will send.
     *
     * @author Daniele Tulone <danieletulone.work@gmail.com>
     */
    @Binding var value: String
    
    /**
     * The body of component.
     *
     * @author Alberto Giacomini
     * @author Andrea Arizzoli
     * @author Daniele Tulone <danieletulone.work@gmail.com>
     */
    var body: some View {
        
        HStack {
            if (self.type == "text" || self.type == "email") {
                TextField(self.placeholder, text: $value)
                    .autocapitalization(
                        self.type == "email" ? .none : .sentences
                    )
                    .modifier(FormTextFieldText())
            }
            
            if (self.type == "password") {
                SecureField(self.placeholder, text: $value)
                    .modifier(FormTextFieldText())
            }
            
            if (self.icon != "") {
                Image(systemName: self.icon)
                    .modifier(FormTextFieldImage())
            }
           
        }.modifier(FormTextField())
        
    }
}
