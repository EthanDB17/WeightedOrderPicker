//
//  WeightedOrderGenerator.swift
//  WeightedOrderPicker
//
//  Created by Ethan Borrowman on 8/25/24.
//

import Foundation

/// A type that can generate and order list of strings when provided a list of ListItem elements
protocol AnyWeightedOrderGenerator: Sendable {
    /// A function that generates a newly ordered list from the provided list using the item weights to
    /// determine the likelihood that an item will be placed at the top of the new list.
    /// The higher an elements weight, the more likely it will return at the top of the list
    /// - parameter list: The list of items, including a name and the item's weight, to be re-ordered
    func generateWeightedOrder(list: [ListItem]) -> [String]
}

struct WeightedOrderGenerator: AnyWeightedOrderGenerator {
    
    func generateWeightedOrder(list: [ListItem]) -> [String] {
        let itemCount = list.count
        var weightedList: [String] = []
        
        let weightCounter = itemCount + 1
        for item in list {
            let numEntries = weightCounter - item.weight
            let itemEntries = [String](repeating: item.name, count: numEntries)
            weightedList.append(contentsOf: itemEntries)
        }
        
        let shuffledList = weightedList.shuffled()
        let orderedList = generateOrder(shuffledList, listSize: itemCount)
        return orderedList
    }
    
    private func generateOrder(_ list: [String], listSize: Int) -> [String] {
        var orderedList: [String] = []
        orderedList.reserveCapacity(listSize)
        var workingList = list
        
        while !workingList.isEmpty {
            guard let randomSelection = workingList.randomElement() else {
                return orderedList
            }
            
            if orderedList.isEmpty {
                orderedList.append(randomSelection)
            } else {
                orderedList.insert(randomSelection, at: 0)
            }
            
            workingList.removeAll(where: { $0 == randomSelection })
            workingList = workingList.shuffled()
        }
        
        return orderedList
    }
}

