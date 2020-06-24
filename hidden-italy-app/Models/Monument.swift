//
//  Monument.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 07/05/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import Foundation

struct Monument: Codable, Identifiable {
    var id: Int
    var name: String
    var description: String
    var lat: Double
    var lon: Double
    var visible: Bool?
    var user_id: Int
    var category_id: Int?
    var category: Category
    var distance: Double?
    var created_at: String?
    var updated_at: String?
    var categories: [Category?]
    var images: [ImageModel?]
    var comments: [Comment] = []
}

let testMonument = Monument(
    id: 1,
    name: "Duomo di Milano",
    description: "blablabal",
    lat: 00,
    lon: 00,
    visible: true,
    user_id: 1,
    category_id: 1,
    category: Category(
        id: 1,
        description: "",
        created_at: "",
        updated_at: ""
    ),
    distance: 1.1,
    created_at: "sjodjifs",
    updated_at: "blabla",
    categories: [],
    images: [ImageModel(
        id: 0,
        title: "",
        description: "",
        url: "",
        monument_id: 0,
        user_id: 0,
        created_at: "",
        updated_at: ""
    )],
    comments: [Comment(
        id: 1,
        content: "Blablabla",
        user_id: 0,
        monument_id: 1,
        created_at: "",
        updated_at: "",
        user: User(
            id: 1,
            firstname: "Jack",
            lastname: "Sparrot",
            email: "alskdlsfk",
            email_verified_at: "salkdlfa",
            role_id: 1,
            created_at: "dklfaksd",
            updated_at: "lsdfkjlas"
        )
    )]
)
