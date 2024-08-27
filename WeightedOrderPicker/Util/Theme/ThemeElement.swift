//
//  ThemeElement.swift
//  WeightedOrderPicker
//
//  Created by Ethan Borrowman on 8/21/24.
//

import Foundation
import SwiftUI

protocol ThemeElement {
    
    // MARK: - Accents -
    
    var primaryAccentColor: Color { get }
    var destructiveAccentColor: Color { get }
    
    // MARK: - Backgrounds -
    
    var primaryBackgroundColor: Color { get }
    var secondaryBackgroundColor: Color { get }
    var fullScreenBlurColor: Color { get }
    
    // MARK: - Text Elements -
    
    var primaryFontColor: Color { get }
    var accentElementFontColor: Color { get }
}
