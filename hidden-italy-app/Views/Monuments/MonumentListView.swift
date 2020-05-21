//
//  MonumentList.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 07/05/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI

struct MonumentsView: View {
    var body: some View {
        VStack {
   
            NavigationView{
                List(0..<5) { item in
                    NavigationLink(destination:
                        MonumentDetailView()
                    ){
                        MonumentRowView()
                    }
                }
                .navigationBarTitle("Monumenti")

            }
        }
    }
}

struct MonumentsView_Previews: PreviewProvider {
    static var previews: some View {
        MonumentsView()
    }
}
