//
//  Picker.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 18/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI

struct PickerView: View {
    
     var colors = ["Red", "Green", "Blue", "Tartan"]
     @State private var selectedColor = 0

     var body: some View {
        VStack {
           Picker(selection: $selectedColor, label: Text("Please choose a color")) {
              ForEach(0 ..< colors.count) {
                 Text(self.colors[$0])
              }
           }
           Text("You selected: \(colors[selectedColor])")
        }
     }
    
}

struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        PickerView()
    }
}
