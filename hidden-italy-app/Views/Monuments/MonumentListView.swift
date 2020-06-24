//
//  ExpandViewTest.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 08/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI
import URLImage
import CoreImage

struct MonumentListView: View {
    
    let itemHeight: CGFloat = 350
    let imageHeight: CGFloat = 300
    let SVWidth = UIScreen.main.bounds.width - 60
    
    @EnvironmentObject var monuments: MonumentViewModel
    @EnvironmentObject var sheetExpandable: SheetExpandable
    
    @State var geo: GeometryProxy?
    @State var zIndexItem: Double = 20.0
    
    let ciContext = CIContext()
    @State var showSheetMonumentView = false
    @State var showAlertMonument = false

    var body: some View {
        
        ZStack {
            ScrollView {
                HStack (alignment: .center){
                    
                    Text("Monumenti")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color(Accent))
                    
                    Spacer()
                    
                    VStack(alignment: .leading){
                        Button(action: {
                            self.showSheetMonumentView.toggle()
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(Color(Accent))
                                .font(.system(size: 35))
                        }
                        .modifier(ButtonCircle())
                        .sheet(isPresented: $showSheetMonumentView) {
                            CreateMonumentView2(
                                showSheetMonumentView: self.$showSheetMonumentView,
                                showAlertMonument: self.$showAlertMonument
                            )
                        }
                    }
                }.padding(.horizontal, 30).padding(.top)
                
                //ForEach_start
                ForEach(monuments.monumentList, id: \.id){thisItem in
                    
                    GeometryReader {geo -> AnyView in
                        return AnyView(
                            
                            ZStack (alignment: .bottom){
                                ItemImage(
                                    item: thisItem,
                                    width: self.SVWidth,
                                    height: self.itemHeight,
                                    context: self.ciContext
                                )
                                
                                Button(action: {
                                    self.monuments.show(id: thisItem.id, view: self, geo: geo)
                                }) {
                                    ZStack (alignment: .bottom){
                                        Rectangle()
                                            .frame(height: 100)
                                            .opacity(0.30)
                                            .blur(radius: 30)
                                            .background(Color.black.opacity(0.2))
                                        
                                        
                                        VStack(alignment: .leading){
                                            Text("\(thisItem.name)")
                                                .font(.largeTitle)
                                                .fontWeight(.bold)
                                                .padding(.bottom)
                                            
                                            HStack(){
                                                Text("\(thisItem.category.description)")
                                                    .foregroundColor(Color.white)
                                                .foregroundColor(Color.white)
                                                Spacer()
                                                Text("\(String(format: "%.2f", thisItem.distance)) km")
                                                    .foregroundColor(Color.white)
                                            }
                                            
                                            
                                        }.padding().foregroundColor(Color.white)
                                        
                                    }.frame(width: self.SVWidth)
                                    
                                }
                                
                                
                                }
                                .frame(width: self.SVWidth)
                                .clipShape(RoundedRectangle(cornerRadius: 35))
                                .modifier(AddImage())

                                .onTapGesture(perform: {
                                    self.monuments.show(id: thisItem.id, view: self, geo: geo)
                                })
                            
                        )
                    }
                        .frame(height:self.itemHeight)
                        .padding(.horizontal, 30)
                        .padding(.bottom, 30)
                    }.coordinateSpace(name: "forEach")
                
                //ForEach_End
            }
            
            GeoSheet(geo: self.$geo)
            
            if (self.showAlertMonument) {
                VStack (alignment: .center) {
                    Text("Grazie per avere segnalato un nuovo monumento.\nAppena verrà approvato sarà disponibile.")
                        .fontWeight(.bold)
                        .padding()
                }.modifier(ValidationSuccessMessage())
                    .onAppear(perform: {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            withAnimation {
                                self.showAlertMonument = false
                            }
                        }
                    })
            }
            
        }.modifier(PaddingSafeArea()).modifier(BgSafearea())
         .onAppear { self.monuments.getNearMonuments() }
    }
}

struct MonumentListView_Previews: PreviewProvider {
    static var previews: some View {
        MonumentListView()
    }
}
