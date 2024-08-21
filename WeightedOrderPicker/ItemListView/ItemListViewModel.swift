//
//  ItemListViewModel.swift
//  WeightedOrderPicker
//
//  Created by Ethan Borrowman on 8/18/24.
//

import Foundation
import Observation

@Observable
class ItemListViewModel {
    
    // MARK: - Properties -
    
    var items: [ListItem] = []
    var presentItemEntryView: Bool = false
    
    init() {
    }
    
    // MARK: - List Management -
    
    /// Adds a new item to the list and assigns it a rank based on its index.
    /// - parameter name: the name of the item being added
    func addItem(_ name: String) {
        let itemWeight = items.count + 1
        items.append(.init(name: name, weight: itemWeight))
    }
}

// MARK: - ItemEntryDelegate -

extension ItemListViewModel: ItemEntryDelegate {
    func dismiss() {
        self.presentItemEntryView = false
    }
    
    func itemEntered(_ name: String) {
        self.addItem(name)
    }
    
    func getNextItemRank() -> Int {
        return items.count + 1
    }
}
