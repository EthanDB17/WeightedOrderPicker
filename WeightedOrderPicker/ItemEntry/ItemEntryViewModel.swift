//
//  ItemEntryViewModel.swift
//  WeightedOrderPicker
//
//  Created by Ethan Borrowman on 8/18/24.
//

import Foundation
import Observation

protocol ItemEntryDelegate: AnyObject {
    func dismiss()
    func itemEntered(_ name: String)
    func getNextItemRank() -> Int
}

@Observable
class ItemEntryViewModel {
    
    // MARK: - Properties -
    
    var name: String = ""
    var currentRank: Int
    weak var delegate: ItemEntryDelegate?
    
    /// View model to handle saving the names entered into the view
    /// - parameter currentRank: the rank of the first item entered by the user
    /// - parameter delegate: the delegate object in charge of handling the values that are entered
    init(currentRank: Int, delegate: ItemEntryDelegate?) {
        self.currentRank = currentRank
        self.delegate = delegate
    }
    
    // MARK: - Data Management -
    
    /// Saves the currently entered name and allows the user to enter another
    func saveAndEnterNext() {
        guard !name.isEmpty else {
            return
        }
        
        saveName(name)
        currentRank = delegate?.getNextItemRank() ?? currentRank
        self.name = ""
    }
    
    /// Saves the currently entered name and dismisses the view
    func saveAndExit() {
        guard !name.isEmpty else {
            return
        }
        
        saveName(name)
        dismiss()
    }
    
    /// Dismisses the view
    func dismiss() {
        delegate?.dismiss()
    }
    
    /// Calls the delegate to save
    /// - parameter name: the name being saved
    private func saveName(_ name: String) {
        delegate?.itemEntered(name)
    }
}
