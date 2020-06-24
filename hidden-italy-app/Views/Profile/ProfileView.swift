//
//  PofileView.swift
//  hidden-italy-app
//
//  Created by user172259 on 17/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI
import URLImage

struct ProfileView: View {
    
    @EnvironmentObject var user: UserViewModel
    
    @State var showSheetSettingsView = false
    @State var isShowingImagePicker = false
    @State var isShowingOverlay = false
    @State var newImage = false
    @State var image = UIImage()
    @State var imageLoaded: Bool = false
    
    var body: some View {
        
        VStack (spacing:20){
            HStack (alignment: .center){
                Spacer()
                VStack(alignment: .leading){
                    Button(action: {
                        self.showSheetSettingsView.toggle()
                    }) {
                        Image(systemName: "gear")
                            .foregroundColor(Color(Accent))
                            .font(.system(size: 24))
                    }.sheet(isPresented: $showSheetSettingsView ) {
                        UserSettings(
                            showSheetSettingsView:
                            self.$showSheetSettingsView
                        ).environmentObject(self.user)
                    }
                }
                
            }.padding(.horizontal, 30)
             .padding(.top, 15)
             .modifier(PaddingSafeArea())
            
            HStack(spacing:20){
                Button(action: {
                    self.isShowingImagePicker.toggle()
                }){
                    ZStack (alignment: .center){
                        
                        if (!self.imageLoaded) {
                            
                            Image(uiImage: image)
                                .resizable()
                                .frame(width:125, height:125)
                                .clipShape(RoundedRectangle(cornerRadius: 35))
                                .modifier(AddImage())
                            
                            Image(systemName: "plus")
                                .font(.system(size: 35))
                                .foregroundColor(Color(Accent))
                            
                        } else {
                            if (self.user.image != nil) {
                                URLImage(
                                    URL(string: baseImageURL() + self.user.image!)!,
                                    content: {
                                        $0.image
                                            .resizable()
                                            .frame(width:125, height:125)
                                            .clipShape(RoundedRectangle(cornerRadius: 35))
                                            .modifier(AddImage())
                                    }
                                )
                            }
                            
                        }
                        
                    }
                }.buttonStyle(PlainButtonStyle())
                    .sheet(isPresented: $isShowingImagePicker,
                           content: {
                            ImagePickerView(
                                isPresented: self.$isShowingImagePicker,
                                selectedImage: self.$image,
                                newImage: self.$newImage,
                                imageLoaded: self.$imageLoaded
                            )
                        })

                
                Text("Ciao, \(user.current.firstname)").modifier(FormTextFieldText())
                    .font(.system(size: 24))
                    .padding(.bottom)
            }.onAppear(perform: {
                self.user.getCurrent(callback: {
                    if (self.user.image != nil) {
                        self.imageLoaded.toggle()
                    }
                })
            })
            
            UserTab()
            
        }.modifier(PaddingSafeArea()).modifier(BgSafearea())
    }
}



struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}


