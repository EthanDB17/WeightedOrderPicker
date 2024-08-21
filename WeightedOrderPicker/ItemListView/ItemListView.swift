//
//  ItemListView.swift
//  WeightedOrderPicker
//
//  Created by Ethan Borrowman on 8/18/24.
//

import SwiftUI

struct ItemListView: View {
    
    @State var viewModel: ItemListViewModel
    
    var body: some View {
        ZStack {
            if viewModel.items.isEmpty {
                emptyView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                NavigationStack {
                    VStack {
                        elementList()
                        Button(action: {
                            // generate random order
                        }, label: {
                            Text("Generate Order")
                        })
                    }
                }
            }
            
            if viewModel.presentItemEntryView {
                ZStack {
                    Theme.shared.fullScreenBlurColor
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .edgesIgnoringSafeArea(.all)
                        .blur(radius: 20)
                    ItemEntryView(viewModel: ItemEntryViewModel(currentRank: viewModel.items.count + 1, delegate: viewModel))
                        .padding(.horizontal, 8)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        
    }
    
    @ViewBuilder private func emptyView() -> some View {
        Button(action: {
            viewModel.presentItemEntryView = true
        }, label: {
            Text("+ Tap To Add Items")
        })
    }
    
    @ViewBuilder private func elementList() -> some View {
        List {
            ForEach(viewModel.items, id: \.weight) { item in
                Text("\(item.weight): \(item.name)")
            }
        }
    }
}

#Preview {
    ItemListView(viewModel: ItemListViewModel())
}
