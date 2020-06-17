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

struct FormTexField: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(15)
            .overlay(RoundedRectangle(cornerRadius: 35)
            .stroke(Color.gray, lineWidth: 1))
    }
}

struct FormTexFieldText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.gray)
    }
}

struct FormTexFieldImage: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.gray)
            .padding(4)
    }
}

struct FormButtom: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color(bgColor))
            .clipShape(Capsule())
    }
}

struct FormButtomText: ViewModifier {
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
