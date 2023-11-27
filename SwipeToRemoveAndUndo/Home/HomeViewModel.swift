//
//  HomeViewModel.swift
//  SwipeToRemoveAndUndo
//
//  Created by Rakan Alotaibi on 06/05/1445 AH.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var productsList = data
    var productStack: [ProductModel] = []

    init(productsList: [ProductModel] = data) {
        self.productsList = productsList
        self.productsList.sort { $0.price < $1.price }
    }

    func removeProduct(id: UUID) {
        if let product = productsList.first(where: { $0.id == id }) {
            productsList.removeAll(where: { $0.id == id })
            productStack.append(product)
            productsList.sort { $0.price < $1.price }
        }
    }

    func unDoRemove() {
        if let product = productStack.popLast() {
            productsList.append(product)
            productsList.sort { $0.price < $1.price }
        }
    }
}

// Testing: Dummy Data
var data: [ProductModel] =
    [
        ProductModel(name: "iPhone",
                     description: "iPhone 15 Pro - A17 pro - 256 GB - Black",
                     price: 1200.0,
                     imageSource: "iPhone15Pro"
        ),
        ProductModel(name: "Samsung Galaxy",
                     description: "Samsung Galaxy S22 - 128 GB - Blue",
                     price: 1100.0,
                     imageSource: "SamsungGalaxyS22"
        ),
        ProductModel(name: "MacBook Pro",
                     description: "MacBook Pro 2023 - 16-inch - M2 Pro",
                     price: 1999.0,
                     imageSource: "MacBookPro"
        ),
    ]
