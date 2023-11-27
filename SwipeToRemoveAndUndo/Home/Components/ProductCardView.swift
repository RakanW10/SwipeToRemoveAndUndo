//
//  ProductCardView.swift
//  SwipeToRemoveAndUndo
//
//  Created by Rakan Alotaibi on 06/05/1445 AH.
//

import SwiftUI

struct ProductCardView: View {
    let product: ProductModel
    var body: some View {
        HStack(spacing: 16) {
            Image(product.imageSource)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.red.opacity(0.125))
                )
            VStack(alignment: .leading) {
                Text(product.name)
                    .font(.title2)
                Text(product.description)
                    .font(.callout)
                    .fontWeight(.thin)
                    .lineLimit(2)
                Text(String(format: "$%.2f", product.price))
                    .font(.title3)
                    .foregroundStyle(Color("Primary"))
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        }
        .frame(maxWidth: .infinity, maxHeight: 120)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
        )
    }
}
