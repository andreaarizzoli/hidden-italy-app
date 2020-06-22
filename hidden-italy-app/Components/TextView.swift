//
//  TextField.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 22/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

struct TextView: UIViewRepresentable {
    
    typealias UIViewType = UITextView
    
    var placeholderText: String = "Descrizione"
    @Binding var text: String
    var limit: Int = 50
    var size: Int = 17
    var weightFont : UIFont.Weight
    
    
    func makeUIView(context: UIViewRepresentableContext<TextView>) -> UITextView {
        let textView = UITextView()
        
        textView.textContainer.lineFragmentPadding = 0
        textView.textContainerInset = .zero
        textView.font = UIFont.systemFont(ofSize: CGFloat(size), weight: weightFont)
        textView.text = placeholderText
        textView.textColor = .placeholderText
        textView.backgroundColor = UIColor.init(displayP3Red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
        
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: UIViewRepresentableContext<TextView>) {
        
        if text != "" || uiView.textColor == .label {
            uiView.text = text
            uiView.textColor = .label
        }
        
        uiView.delegate = context.coordinator
    }
    
    func frame(numLines: CGFloat) -> some View {
        let height = UIFont.systemFont(ofSize: 17).lineHeight * numLines
        return self.frame(height: height)
    }
    
    func makeCoordinator() -> TextView.Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        var parent: TextView
        
        init(_ parent: TextView) {
            self.parent = parent
        }
        func textViewDidChange(_ textView: UITextView) {
            if (textView.text.count > parent.limit) {
                textView.text = String(
                    textView.text[textView.text.startIndex..<textView.text.index(textView.text.startIndex, offsetBy: parent.limit)])
            }
            
            parent.text = textView.text
        }
        func textViewDidBeginEditing(_ textView: UITextView) {
            if textView.textColor == .placeholderText {
                textView.text = ""
                textView.textColor = .label
            }
        }
        func textViewDidEndEditing(_ textView: UITextView) {
            if textView.text == "" {
                textView.text = parent.placeholderText
                textView.textColor = .placeholderText
            }
        }
    }

}



// Utilizzo con stile MarlonDesign
//VStack(alignment: .leading) {
//    TextView(placeholderText: "Inserisci testo...", text: $text, limit: self.characterLimitDescription, size: 17, weightFont: .light).frame(numLines: 10)
//
//    // .disabled(text.count > (characterLimitDescription - 1))
//    .font(.system(size: 20, weight: .light))
//    .opacity(0.8)
//
//    Text("\(text.count)/\(self.characterLimitDescription)")
//    .font(.system(size: 14, weight: .light))
//    .opacity(0.2)
//
//}
