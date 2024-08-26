//
//  OrderedItemListViewModel.swift
//  WeightedOrderPicker
//
//  Created by Ethan Borrowman on 8/25/24.
//

import Foundation
import Observation

@Observable
final class OrderedItemListViewModel: @unchecked Sendable {
    
    // MARK: - Types -
    
    enum State {
        case loading
        case loaded
    }
    
    // MARK: - Properties -
    
    let orderGenerator: AnyWeightedOrderGenerator
    let startingList: [ListItem]
    
    var orderedList: [String] = []
    var state: State = .loading
    
    /// Observable class meant to handle re-ordering the list into the weighted random order
    /// - parameter startingList: the initial, unsorted list of elements and their weights
    /// - parameter orderGenerator: the object used to generate the order list, defaulted to a standard WeightedOrderGenerator
    init(startingList: [ListItem], orderGenerator: AnyWeightedOrderGenerator = WeightedOrderGenerator()) {
        self.startingList = startingList
        self.orderGenerator = orderGenerator
        
        self.generateRandomOrderedElements()
    }
    
    // MARK: - List Management -
    
    /// Creates a weighted random ordered list using the values in self.startingList
    func generateRandomOrderedElements() {
        self.state = .loading
        Task {
            let generatedList = self.orderGenerator.generateWeightedOrder(list: self.startingList)
            await MainActor.run {
                self.orderedList = generatedList
                self.state = .loaded
            }
        }
    }
}
