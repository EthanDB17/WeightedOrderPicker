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
                if !viewModel.presentItemEntryView {
                    emptyView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            } else {
                NavigationStack {
                    VStack {
                        elementList()
                        NavigationLink("Generate Weighted Order", value: viewModel.items)
                            .buttonStyle(ThemedButtonStyle(horizontalPadding: 16))
                    }
                    .navigationDestination(for: [ListItem].self) { items in
                        OrderedItemListView(viewModel: OrderedItemListViewModel(startingList: items))
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
            withAnimation(.easeIn.speed(1.5)) {
                viewModel.presentItemEntryView = true
            }
        }, label: {
            ThemedText("+ Tap To Add Items", weight: .medium)
        })
    }
    
    @ViewBuilder private func elementList() -> some View {
        List {
            ForEach(viewModel.items, id: \.weight) { item in
                ThemedText("\(item.weight): \(item.name)")
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    ItemListView(viewModel: ItemListViewModel())
}
