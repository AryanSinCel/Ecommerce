//
//  CategoryModel.swift
//  Ecommerce
//
//  Created by Celestial on 28/01/25.
//

import SwiftUI

struct CategoryModel: Identifiable, Hashable{
    var id: UUID = .init()
    var icon: String
    var title: String
}

var categoryList: [CategoryModel] = [
    CategoryModel(icon: "", title: "All"),
    CategoryModel(icon: "cookie", title: "Cookies"),
    CategoryModel(icon: "waffle", title: "Waffles"),
    CategoryModel(icon: "toffee", title: "Toffees"),
    CategoryModel(icon: "chips", title: "Chips"),
    CategoryModel(icon: "chocolate", title: "Chocolates")
]
