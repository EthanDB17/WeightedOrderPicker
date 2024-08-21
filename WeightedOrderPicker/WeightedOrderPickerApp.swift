//
//  WeightedOrderPickerApp.swift
//  WeightedOrderPicker
//
//  Created by Ethan Borrowman on 8/18/24.
//

import SwiftUI

@main
struct WeightedOrderPickerApp: App {
    var body: some Scene {
        WindowGroup {
            ItemListView(viewModel: ItemListViewModel())
        }
    }
}
