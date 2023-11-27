//
//  ContentView.swift
//  SwipeToRemoveAndUndo
//
//  Created by Rakan Alotaibi on 06/05/1445 AH.
//

import SwiftUI

struct HomeView: View {
    @StateObject var vm = HomeViewModel()
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            VStack {
                List {
                    ForEach(vm.productsList) { product in
                        ProductCardView(product: product)
                            .swipeActions {
                                Button(role: .destructive) {
                                    vm.removeProduct(id: product.id)
                                } label: {
                                    Label("Delete", systemImage: "trash.fill")
                                }
                            }
                    }
                }

                Button(action: {
                    withAnimation {
                        vm.unDoRemove()
                    }

                }, label: {
                    Text("Undo")
                })
            }
        }
    }
}

#Preview {
    HomeView()
}
