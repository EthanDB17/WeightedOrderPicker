//
//  ThemeElement.swift
//  WeightedOrderPicker
//
//  Created by Ethan Borrowman on 8/21/24.
//

import Foundation
import SwiftUI

protocol ThemeElement {
    
    // MARK: - Backgrounds -
    
    var primaryBackgroundColor: Color { get }
    var secondaryBackgroundColor: Color { get }
    var fullScreenBlurColor: Color { get }
    
    // MARK: - Text Elements -
    
    var primaryFontColor: Color { get }
    
    // MARK: - Button Elements -
    
    var primaryButtonBackgroundColor: Color { get }
    var primaryDestructiveButtonBackgroundColor: Color { get }
    var primaryButtonTextColor: Color { get }
}
