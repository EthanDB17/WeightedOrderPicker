//
//  ItemEntryViewModel.swift
//  WeightedOrderPicker
//
//  Created by Ethan Borrowman on 8/18/24.
//

import Foundation
import Observation
import Combine

protocol ItemEntryDelegate: AnyObject {
    func dismiss()
    func itemEntered(_ name: String)
    func getNextItemRank() -> Int
}

/// View model to handle saving the names entered into the view.
///
/// The class accepts a starting rank for the first item that will be entered to display
/// on the view. It also utilizes two Combine PassthroughSubjects to alert the presenting
/// view when a new name is to be saved and when the view needs to be dismissed.
///
///     let nameSaved = PassthroughSubject<String, Never>()
///     let dismissView = PassthroughSubject<Void, Never>()
@Observable
class ItemEntryViewModel {
    
    // MARK: - Properties -
    
    var name: String = ""
    var currentRank: Int
    
    let nameSaved = PassthroughSubject<String, Never>()
    let dismissView = PassthroughSubject<Void, Never>()
    
    /// View model to handle saving the names entered into the view
    /// - parameter currentRank: the rank of the first item entered by the user
    init(currentRank: Int) {
        self.currentRank = currentRank
    }
    
    // MARK: - Data Management -
    
    /// Saves the currently entered name and allows the user to enter another
    func saveAndEnterNext() {
        guard !name.isEmpty else {
            return
        }
        
        nameSaved.send(name)
        currentRank += 1
        self.name = ""
    }
    
    /// Saves the currently entered name and dismisses the view
    func saveAndExit() {
        guard !name.isEmpty else {
            return
        }
        
        nameSaved.send(name)
        dismiss()
    }
    
    /// Dismisses the view
    func dismiss() {
        dismissView.send()
    }
}
