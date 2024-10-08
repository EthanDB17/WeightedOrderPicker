//
//  ItemListViewModel.swift
//  WeightedOrderPicker
//
//  Created by Ethan Borrowman on 8/18/24.
//

import Foundation
import Observation
import Combine

/// ViewModel in charge of managing the list items added to be ordered
/// - Description: Manages a list of ListItem elements that are entered in the UI. Also handles the presentation and acts as a delegate for the presenation popup.
@Observable
class ItemListViewModel {
    
    // MARK: - Properties -
    
    var items: [ListItem] = []
    var popupViewType: PopupViewType?
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
    }
    
    // MARK: - List Management -
    
    /// Adds a new item to the list and assigns it a rank based on its index.
    /// - parameter name: the name of the item being added
    func addItem(_ name: String) {
        let itemWeight = items.count + 1
        items.append(.init(name: name, weight: itemWeight))
    }
    
    @MainActor
    func presentItemEntryPopup() {
        let itemEntryVM = ItemEntryViewModel(currentRank: items.count + 1)
        itemEntryVM.nameSaved
            .sink { [weak self] name in
                guard let self else { return }
                self.items.append(.init(name: name, weight: self.items.count + 1))
            }
            .store(in: &cancellables)
        itemEntryVM.dismissView
            .sink { [weak self] in
                self?.popupViewType = nil
            }
            .store(in: &cancellables)
        
        self.popupViewType = .itemEntryView(viewModel: itemEntryVM)
    }
}
