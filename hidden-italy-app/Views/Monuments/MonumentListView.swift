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
import SkeletonUI

struct MonumentListView: View {
    
    let itemHeight:CGFloat = 350
    let imageHeight:CGFloat = 300
    let SVWidth = UIScreen.main.bounds.width - 40
    
    @ObservedObject var monuments = MonumentViewModel()
    @State var expandedItem = testMonument
    @State var expandedScreen_startPoint = CGRect(x: 0, y: 0, width: 100, height: 100)
    @State var expandedScreen_returnPoint = CGRect(x: 0, y: 0, width: 100, height: 100)
    @State var expandedScreen_shown = false
    @State var expandedScreen_willHide = false
    var url = "http://127.0.0.1:8000/"
    let ciContext = CIContext()
    @State var showSheetMonumentView = false
    
    var body: some View {
        
        ZStack{
            Color.white.edgesIgnoringSafeArea(.all)
            ScrollView{
                HStack (alignment: .center){
                    Text("Monumenti")
                        .font(.largeTitle)
                    Spacer()
                    VStack(alignment: .leading){
                        Button(action: {
                            self.showSheetMonumentView.toggle()
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(Color(bgColor))
                                .font(.system(size: 35))
                        }.sheet(isPresented: $showSheetMonumentView) {
                            //                            CreateMonumentView()
                            CreateMonumentView2(showSheetMonumentView: self.$showSheetMonumentView)
                        }
                    }
                }.padding(.horizontal, 30).padding(.top)
                
                //ForEach_start
                ForEach(monuments.monumentList, id: \.id){thisItem in
                    
                    GeometryReader{geo -> AnyView in
                        return AnyView(
                            
                            ZStack (alignment: .bottom){
                                
                                URLImage(URL(string: "\(self.url)storage/\(thisItem.images[0]!.url)")!, processors: [
                                    CoreImageFilterProcessor(name: "CISepiaTone", parameters: [ kCIInputIntensityKey: 0.2 ], context: self.ciContext),
                                    Resize(size: CGSize(width: self.SVWidth, height: self.itemHeight), scale: UIScreen.main.scale) ], content: {
                                        $0.image
                                            .resizable()
                                            //            .offset(x: self.show ? -330 : 0)
                                            //            .rotationEffect(Angle(degrees: self.show ? 10 : 0))
                                            .clipped()
                                })
                                
                                
                                Button(action: {
                                    self.expandedItem = thisItem
                                    print(self.expandedItem)
                                    let x = geo.frame(in: .global).minX
                                    let y = geo.frame(in: .global).minY
                                    let thisRect = CGRect(x: x, y: y, width:self.SVWidth, height: self.itemHeight)
                                    self.expandedScreen_returnPoint = thisRect
                                    self.expandedScreen_startPoint =  thisRect
                                    
                                    Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false) { (timer) in
                                        self.expandedScreen_shown = true
                                        self.expandedScreen_startPoint =  CGRect(x: 0, y: 0, width:UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
                                    }
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
                            .cornerRadius(15).foregroundColor(.white)
                            .shadow(color: .init(red: 0.1, green: 0.1, blue: 0.1)
                                , radius: 11 , x: 0, y: 4)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                            
                            
                        )
                    }.background(Color.clear.opacity(0.4))
                        .frame(height:self.itemHeight)
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                        .padding(.bottom, 20)
                }.coordinateSpace(name: "forEach")
                
                //ForEach_End
            }
            GeometryReader{geo -> AnyView in
                let thisItem = self.expandedItem
                
                return AnyView(
                    
                    ZStack{
                        ScrollView{
                            VStack(spacing:0){
                                ZStack{
                                    Image("duomo")
                                        .resizable()
                                        .scaledToFill()
                                        .offset(y: self.expandedScreen_shown ? 0 : 0)
                                        .frame(width:self.expandedScreen_shown ? UIScreen.main.bounds.width : self.SVWidth, height: self.itemHeight)
                                    
                                    //                                URLImage(URL(string: "\(self.url)storage/\(thisItem.images[0]!.url)")!, content: {
                                    //                                    $0.image
                                    //                                    .resizable()
                                    //                                    .scaledToFill()
                                    //                                    .offset(y: self.expandedScreen_shown ? 0 : 0)
                                    //                                    .frame(width:self.expandedScreen_shown ? UIScreen.main.bounds.width : self.SVWidth, height: self.itemHeight
                                    //                                    )})
                                    //                                    .clipped()
                                    //                                    .background(Color.white)
                                    //                                    .foregroundColor(Color.green)
                                    //                                    .edgesIgnoringSafeArea(.top)
                                    
                                    VStack{
                                        HStack{
                                            
                                            VStack(alignment: .leading){
                                                
                                                Text("\(thisItem.category_id)")
                                                    .font(.system(size: 18, weight: .bold, design: .default))
                                                    .foregroundColor(.init(red: 0.8 , green: 0.8, blue: 0.8  )).opacity(1.0)
                                                Text("\(thisItem.name)")
                                                    .font(.system(size: 36, weight: .bold, design: .default))
                                                    .foregroundColor(.white)
                                            }.padding()
                                            Spacer()
                                        }.offset(y:
                                            self.expandedScreen_shown ? 44 : 0)
                                        Spacer()
                                    }.frame(width: self.expandedScreen_startPoint.width)
                                }.frame(height:
                                    self.itemHeight
                                ).zIndex(1)
                                Text("\(thisItem.description)").padding().frame(
                                    maxHeight: self.expandedScreen_shown ? .infinity : 0)
                            }
                            Button(action:{}){
                                MapMonumentView(latitude: thisItem.lat, longitude: thisItem.lon, regionRadius: 350)
                                    .frame(height: 100)
                            }
                            
                        }
                        .background(Color.white)
                        .frame(width: self.expandedScreen_startPoint.width, height: self.expandedScreen_startPoint.height)
                        .background(Color.clear)
                        .cornerRadius(self.expandedScreen_shown ? 0 : 15 )
                        .animation(.easeInOut(duration: 0.3))
                        .offset(x: self.expandedScreen_startPoint.minX, y: self.expandedScreen_startPoint.minY)
                        
                        Button(action: {
                            self.expandedScreen_willHide = true
                            self.expandedScreen_startPoint = self.expandedScreen_returnPoint
                            
                            self.expandedScreen_shown = false
                            Timer.scheduledTimer(withTimeInterval: 0.6, repeats: false) { (timer) in
                                self.expandedScreen_willHide = false
                            }
                        }){
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.init(white: 0.9))
                                .font(.system(size: 25)).padding()
                                .opacity(self.expandedScreen_shown ? 1 : 0.0)
                                .animation(
                                    Animation.easeInOut(duration: 0.3))
                        }.offset(x: (UIScreen.main.bounds.width/2) - 30, y: (-1 * UIScreen.main.bounds.height/2) + 60)
                    }
                )
            }.edgesIgnoringSafeArea(.top)
                .opacity(self.expandedScreen_shown ? 1 : 0.0)
                .animation(
                    Animation.easeInOut(duration: 0.05)
                        .delay(self.expandedScreen_willHide ? 0.5 : 0))
        }.modifier(pSafeAreaTop()).onAppear {
            self.monuments.getNearMonuments()
        }
    }
}

struct MonumentListView_Previews: PreviewProvider {
    static var previews: some View {
        MonumentListView()
    }
}
