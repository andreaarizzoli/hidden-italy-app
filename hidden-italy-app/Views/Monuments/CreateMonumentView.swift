//
//  MonumentView.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 16/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI

struct CreateMonumentView: View {
    
    @ObservedObject var monuments = MonumentViewModel()
    @Binding var showSheetMonumentView: Bool
    @State private var name = ""
    @State private var description = ""
    @State private var lat = ""
    @State private var lon = ""
    @State private var category = ""
    
<<<<<<< HEAD

=======
    @State var isShowingImagePicker = false
    @State var imageInBox = UIImage() //imageInBox
    
>>>>>>> Add picker Image.
    var body: some View {
        
        ScrollView{
            VStack (alignment: .center, spacing:20){
                HStack {
                Spacer()
                    Button(action: { self.showSheetMonumentView = false }){
                        Image(systemName: "xmark.circle.fill")
                        .foregroundColor(Color(.gray))
                        .font(.system(size: 25))
                    }
                }.padding(.top, 30)
                            
               
                Button(action: {
                    self.isShowingImagePicker.toggle()
                }){
                    ZStack (alignment: .center){

                        Image(uiImage: imageInBox)
                        .resizable()
                        .frame(width:150, height:150)
                        .clipShape(RoundedRectangle(cornerRadius: 35))
                        .overlay(RoundedRectangle(cornerRadius: 35)
                        .stroke(Color.gray, lineWidth: 1))
                        
                        Image(systemName: "plus")
                        .font(.system(size: 20))
                        .foregroundColor(.gray)


                    }
                    
                }.buttonStyle(PlainButtonStyle())
                    .sheet(isPresented: $isShowingImagePicker, content: {
                        ImagePickerView(isPresented: self.$isShowingImagePicker, selectedImage: self.$imageInBox)
                    })

                
                HStack {
                    TextField("Nome", text: $name).modifier(FormTexFieldText())
                    Image(systemName: "person").modifier(FormTexFieldImage())
                }.modifier(FormTexField())
                
                HStack {
                    TextField("Descrizione", text: $description).modifier(FormTexFieldText())
                    Image(systemName: "person").modifier(FormTexFieldImage())
                }.modifier(FormTexField())
                
                HStack {
                    HStack {
                        TextField("Latitudine", text: $lat).modifier(FormTexFieldText())
                        Image(systemName: "person").modifier(FormTexFieldImage())
                    }.modifier(FormTexField())
                    
                    HStack {
                        TextField("Longitudine", text: $lon).modifier(FormTexFieldText())
                        Image(systemName: "person").modifier(FormTexFieldImage())
                    }.modifier(FormTexField())
                }
                
                HStack {
                    TextField("Category", text: $category).modifier(FormTexFieldText())
                    Image(systemName: "person").modifier(FormTexFieldImage())
                }.modifier(FormTexField())
                
                Button(action:  {
                    self.monuments.createMonument(
                        name: self.name,
                        description: self.description,
                        lat: self.lat,
                        lon: self.lon,
                        category: self.category
                    )
                    self.showSheetMonumentView = false
                    print(self.imageInBox)
                }){
                    Text("Inserisci")
                        .modifier(FormButtomText())
                }.modifier(FormButtom())
                
                Spacer()
                
                }.modifier(Form())
        }
    }
}


struct CreateMonumentView_Previews: PreviewProvider {
    static var previews: some View {
        CreateMonumentView(showSheetMonumentView: .constant(true))
    }
}

struct DummyView: UIViewRepresentable{
    
    func makeUIView(context: UIViewRepresentableContext<DummyView>) -> UIButton {
        let button = UIButton()
        button.setTitle("DUMMY", for: .normal)
        //button.bakgroundColor = .red
        return button
    }
    
    func updateUIView(_ uiView: DummyView.UIViewType, context: UIViewRepresentableContext<DummyView>) {
    }
}

struct ImagePickerView: UIViewControllerRepresentable {
    
    @Binding var isPresented: Bool
    @Binding var selectedImage: UIImage
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePickerView>) -> UIViewController {
        let controller = UIImagePickerController()
        controller.delegate = context.coordinator
        return controller
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        let parent: ImagePickerView
        init(parent: ImagePickerView) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let selectedImage = info[.originalImage] as? UIImage {
                print(selectedImage)
                self.parent.selectedImage = selectedImage
            }
            self.parent.isPresented = false
        }
        
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: UIViewControllerRepresentableContext<ImagePickerView>) {
    }
}
