//
//  MonumentListView2.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 04/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI
import URLImage
import CoreImage

struct MonumentListView2: View {
    
    @ObservedObject var monuments = MonumentViewModel()

    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)).edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack {
                    Text("Monumenti")
                        .font(.largeTitle).bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 30)

                    ForEach(monuments.monumentList) { item in
                        GeometryReader { geometry in
                            CardView(monument: item, minY: geometry.frame(in: .global).minY, maxY: geometry.frame(in: .global).maxY)
//
//                            Text("\(geometry.frame(in: .global).maxY / 1000 + 1)")
                        }

                        .frame(width: 300)
                        .frame(height: 350)
                    }
                }
            }
        }.onAppear {
        self.monuments.getMonuments()
        }
    }
}

struct MonumentListView2_Previews: PreviewProvider {
    static var previews: some View {
        MonumentListView2()
    }
}

struct CardView: View {
    @State var show = false
    @State var monument: Monument
    var url = "http://127.0.0.1:8000/"
    let ciContext = CIContext()

    var minY: CGFloat
    var maxY: CGFloat

    
    var body: some View {
        ZStack {

            URLImage(URL(string: "\(url)storage/\(monument.images[0]!.url)")!, processors: [
                CoreImageFilterProcessor(name: "CISepiaTone", parameters: [ kCIInputIntensityKey: 0.2 ], context: self.ciContext),
                Resize(size: CGSize(width: 300.0, height: 350.0), scale: UIScreen.main.scale) ], content: {
            $0.image
            .resizable()
            
            .offset(x: self.show ? -330 : 0)
            .rotationEffect(Angle(degrees: self.show ? 10 : 0))
            .clipped()
            })
            .animation(.spring(response: 0.6, dampingFraction: 0.6, blendDuration: 0)).frame(width: 300, height: 350)
        }
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.3), radius: self.show ? 100 : 40, x:0, y: self.show ? 100 : 20)
        .scaleEffect(minY<0 ? minY / 1000 + 1 : 1, anchor: .bottom)

//        .rotation3DEffect(Angle(degrees: Double(minY / 10)), axis: (x: -20, y: 0, z: 0))
            .rotation3DEffect(Angle(degrees: Double(minY / 100)), axis: (x: minY*2, y: 0, z: 0))

        .onTapGesture {
//            self.show.toggle()
            //MapView2()
        }
    }
}
