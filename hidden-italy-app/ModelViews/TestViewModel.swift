//
//  TestViewModel.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 21/05/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import Foundation

struct Course: Identifiable, Decodable {
    let id = UUID()
    let name: String
}


class TestViewModel: ObservableObject {
    
  @Published var courses: [Course] = [
    .init(name: "Course 1"),
    .init(name: "Course 2"),
    .init(name: "Course 3")
    ]

}
