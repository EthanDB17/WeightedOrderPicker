//
//  OrderedItemListView.swift
//  WeightedOrderPicker
//
//  Created by Ethan Borrowman on 8/25/24.
//

import SwiftUI

struct OrderedItemListView: View {
    
    @State var viewModel: OrderedItemListViewModel
    
    var body: some View {
        switch viewModel.state {
        case .loading:
            loadingView()
        case .loaded:
            listView()
        }
    }
    
    @ViewBuilder private func loadingView() -> some View {
        HStack {
            ProgressView()
            ThemedText("Generating List...")
        }
    }
    
    @ViewBuilder private func listView() -> some View {
        List {
            ForEach(viewModel.orderedList, id: \.self) { item in
                ThemedText(item)
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    OrderedItemListView(viewModel: OrderedItemListViewModel(startingList: [.init(name: "Item 1", weight: 1), .init(name: "Item 2", weight: 2), .init(name: "Item 3", weight: 3)]))
}
