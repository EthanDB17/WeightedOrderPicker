//
//  ListItem.swift
//  WeightedOrderPicker
//
//  Created by Ethan Borrowman on 8/18/24.
//

import Foundation

/// Items used when creating the initial list of elements to re-order
/// - parameter name: the string value shown for the item
/// - parameter weight: the weighted value of the item when selecting the items for ordering
struct ListItem {
    let name: String
    let weight: Int
}
