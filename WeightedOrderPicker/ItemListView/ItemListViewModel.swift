//
//  ItemListViewModel.swift
//  WeightedOrderPicker
//
//  Created by Ethan Borrowman on 8/18/24.
//

import Foundation
import Observation

/// ViewModel in charge of managing the list items added to be ordered
/// - Description: Manages a list of ListItem elements that are entered in the UI. Also handles the presentation and acts as a delegate for the presenation popup.
@Observable
class ItemListViewModel {
    
    // MARK: - Properties -
    
    var items: [ListItem] = []
    var popupViewType: PopupViewType?
    
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
        self.popupViewType = nil
    }
    
    func itemEntered(_ name: String) {
        self.addItem(name)
    }
    
    func getNextItemRank() -> Int {
        return items.count + 1
    }
}
