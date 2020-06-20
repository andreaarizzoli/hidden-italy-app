//
//  CustomModifier.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 17/06/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI

struct Form: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 30)
            .padding(.bottom)
    }
}

struct FormTextField: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(15)
            .overlay(RoundedRectangle(cornerRadius: 35)
                .stroke(Color.gray, lineWidth: 1))
    }
}

struct FormTextFieldText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.gray)
    }
}

struct FormTextFieldImage: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.gray)
            .padding(4)
    }
}

struct FormButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color(bgColor))
            .clipShape(Capsule())
    }
}

struct FormButtonText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
    }
}

struct LoginText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color.gray.opacity(0.5))
    }
}

//struct DismissingKeyboard: ViewModifier {
//    func body(content: Content) -> some View {
//        content
//            .onTapGesture {
//                let keyWindow = UIApplication.shared.connectedScenes
//                        .filter({$0.activationState == .foregroundActive})
//                        .map({$0 as? UIWindowScene})
//                        .compactMap({$0})
//                        .first?.windows
//                        .filter({$0.isKeyWindow}).first
//                keyWindow?.endEditing(true)
//        }
//    }
//}

struct Icon: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.system(size: 30))
            .foregroundColor(Color(darkAccent))
    }
}

struct ValidationErrorMessage: ViewModifier{
    func body(content: Content) -> some View {
    content
        .foregroundColor(Color .white)
        .frame(maxWidth: .infinity)
        .background(Color .red)
        .cornerRadius(35)
    }
}

struct OverlayBackGround: ViewModifier{
    func body(content: Content) -> some View {
    content
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .background(Color (.black)
        .opacity(0.5))
    }
}


