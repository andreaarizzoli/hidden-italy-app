//
//  TestData.swift
//  hidden-italy-app
//
//  Created by Andrea Arizzoli on 18/05/2020.
//  Copyright © 2020 Andrea Arizzoli. All rights reserved.
//

import SwiftUI

struct Post: Codable, Identifiable {
    let id = UUID()
    var description: String
    var created_at: String
    var updated_at: String?
}

class CategoryApi2 {
    
    func getCategories() {
        guard let url = URL(string: "http://127.0.0.1:8000/api/categories") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let posts = try! JSONDecoder().decode([Post].self, from: data!)
            print(posts)
        }.resume()
    }
}
