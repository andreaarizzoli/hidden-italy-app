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
    let SVWidth = UIScreen.main.bounds.width - 60
    
    @ObservedObject var monuments = MonumentViewModel()
    @State var expandedScreen_startPoint = CGRect(x: 0, y: 0, width: 100, height: 100)
    @State var expandedScreen_returnPoint = CGRect(x: 0, y: 0, width: 100, height: 100)
    @State var expandedScreen_shown = false
    @State var expandedScreen_willHide = false
    var url = "http://127.0.0.1:8000/"
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
                                URLImage(
                                    URL(string: "\(self.url)storage/\(thisItem.images[0]!.url)")!,
                                    processors: [CoreImageFilterProcessor(
                                        name: "CISepiaTone",
                                        parameters: [ kCIInputIntensityKey: 0.2 ],
                                        context: self.ciContext),
                                        Resize(size: CGSize(width: self.SVWidth, height: self.itemHeight),
                                        scale: UIScreen.main.scale
                                        )
                                    ],
                                    placeholder: {_ in
                                        Image(systemName: "phImage")
                                            .resizable()
                                            .clipped()
                                    },
                                    content: {
                                        $0.image
                                            .resizable()
                                            .clipped()
                                    }
                                )
                                
                                Button(action: {
                                    self.monuments.testMonument = thisItem
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
                                .frame(width: self.SVWidth)
                                .clipShape(RoundedRectangle(cornerRadius: 35))
                                .modifier(AddImage())

                                .onTapGesture(perform: {
                                    self.monuments.testMonument = thisItem
                                    let x = geo.frame(in: .global).minX
                                    let y = geo.frame(in: .global).minY
                                    let thisRect = CGRect(x: x, y: y, width:self.SVWidth, height: self.itemHeight)
                                    self.expandedScreen_returnPoint = thisRect
                                    self.expandedScreen_startPoint =  thisRect
                                    
                                    Timer.scheduledTimer(withTimeInterval: 5.3, repeats: false) { (timer) in
                                        self.expandedScreen_shown = true
                                        self.expandedScreen_startPoint =  CGRect(x: 0, y: 0, width:UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
                                    }
                                })
                            
                        )
                    }
                        .frame(height:self.itemHeight)
                        .padding(.horizontal, 30)
                        .padding(.bottom, 30)
                    }.coordinateSpace(name: "forEach")
                
                //ForEach_End
            }
            
            GeometryReader{geo -> AnyView in
                
                return AnyView(
                    
                    ZStack{
                        ScrollView{
                            VStack(spacing:0){
                                ZStack{
                                    
                                    if (self.expandedScreen_shown) {
                                        URLImage(
                                            URL(string: "\(self.url)storage/\(self.monuments.testMonument.images[0]!.url)")!,
                                            processors: [
                                                Resize(size: CGSize(width: self.SVWidth, height: self.itemHeight),
                                                scale: UIScreen.main.scale)
                                            ],
                                            placeholder: {_ in
                                                Image(systemName: "duomo")
                                                    .resizable()
                                                    .clipped()
                                            },
                                            content: {
                                                $0.image
                                                    .resizable()
                                                    .clipped()
                                                    .cornerRadius(radius: 35, corners: [.bottomLeft, .bottomRight])
                                                    .shadow(color: Color(darkShadow), radius: 10, x: 10, y: 10)
                                                    .shadow(color: Color.white.opacity(0.7), radius: 10, x: -10, y: -10)

                                            }
                                        )
                                    }
                                    
                                    VStack{
                                        
                                        HStack{
                                            
                                            VStack(alignment: .leading){
                                                
                                                Text("\(self.monuments.testMonument.name)")
                                                    .font(.largeTitle)
                                                    .fontWeight(.bold)
                                                    .foregroundColor(.white)
                                                    .padding(.bottom)
                                                Text("\(self.monuments.testMonument.category.description)")
                                                    .padding(.vertical, 3)
                                                    .padding(.horizontal, 10)
                                                    .font(.system(size: 18, weight: .light, design: .default))
                                                    .foregroundColor(Color(Accent))
                                                    .background(Capsule()
                                                    .fill(Color .white))
//                                                    .shadow(color: Color(darkShadow), radius: 10, x: 10, y: 10)
//                                                    .shadow(color: Color.white.opacity(0.7), radius: 10, x: -10, y: -10)
        
                                            }.padding(.horizontal)
                                            
                                            Spacer()
                                            
                                        }.offset(y: self.expandedScreen_shown ? 44 : 0)
                                        
                                        Spacer()
                                        
                                    }.frame(width: self.expandedScreen_startPoint.width)
                                }
                                .frame(height:
                                    self.itemHeight
                                ).zIndex(1)
                                Text("\(self.monuments.testMonument.description)")
                                    .padding(.horizontal).padding(.vertical, 50)
//                                    .frame(
//                                    maxHeight: self.expandedScreen_shown ? .infinity : 0)
                            }
                            Button(action:{}){
                                MapMonumentView(latitude: self.monuments.testMonument.lat, longitude: self.monuments.testMonument.lon, regionRadius: 350)
                                    .cornerRadius(35)
                                    .frame(height: 250)
                                    .padding(.horizontal, 30)
                                    .shadow(color: Color(darkShadow), radius: 10, x: 10, y: 10)
                                    .shadow(color: Color.white.opacity(0.7), radius: 10, x: -10, y: -10)
                                    .padding(.bottom, 60)

                            }
                            if (self.expandedScreen_shown) {
                                CommentListView(monument: self.monuments.testMonument).padding(.bottom, 60)
                            }
                            
                        }
                        .background(Color (BGColor))
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
                                .foregroundColor(Color(Accent))
                                .font(.system(size: 25))
                                .padding()
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
