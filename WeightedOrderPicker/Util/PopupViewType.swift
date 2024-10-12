//
//  PopupViewType.swift
//  WeightedOrderPicker
//
//  Created by Ethan Borrowman on 8/26/24.
//

import Foundation

enum PopupViewType: Equatable {
    case itemEntryView(viewModel: ItemEntryViewModel)
    case informationView
    
    static func == (lhs: PopupViewType, rhs: PopupViewType) -> Bool {
        switch (lhs, rhs) {
        case (.itemEntryView(_), .itemEntryView(viewModel: _)):
            return true
            
        case (.informationView, .informationView):
            return true
            
        default:
            return false
        }
    }
}
