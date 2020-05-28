//
//  MonumentList.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 07/05/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI

struct MonumentsView: View {
    
    @ObservedObject var monuments = MonumentViewModel()

    var body: some View {
        VStack {
            
            NavigationView{
                List(monuments.monumentList) { monument in
                    NavigationLink(destination:
                        MonumentDetailView(monument: monument)
                    ){
                        MonumentRowView(monument: monument)
                    }
                }
                //.navigationBarTitle("Monumenti")
                    .navigationBarTitle(Text("Monumenti"), displayMode: .inline)
            }
        }.onAppear {
            self.monuments.getMonuments()
        }
    }
}

struct MonumentsView_Previews: PreviewProvider {
    static var previews: some View {
        MonumentsView()
    }
}

