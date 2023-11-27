//
//  PersonModel.swift
//  SwipeToRemoveAndUndo
//
//  Created by Rakan Alotaibi on 06/05/1445 AH.
//

import Foundation

struct ProductModel: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let price: Double
    let imageSource: String
}
