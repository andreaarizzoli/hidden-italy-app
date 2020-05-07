//
//  MonumentList.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 07/05/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI

struct MonumentListView: View {
    var body: some View {
        VStack {
   
            NavigationView{
                List(0..<5) { item in
                    NavigationLink(destination:
                        MonumentView()
                    ){
                        MonumentRowView()
                        
                    }
                }
                .navigationBarTitle("Monumenti")
            }
        }
    }
}

struct MonumentListView_Previews: PreviewProvider {
    static var previews: some View {
        MonumentListView()
    }
}
