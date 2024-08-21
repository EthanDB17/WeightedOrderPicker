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
    
    var primaryBackground: Color { get }
    var secondaryBackground: Color { get }
    var fullScreenBlurColor: Color { get }
    
    // MARK: - Text Elements -
    
    var primaryFontColor: Color { get }
    
    // MARK: - Button Elements -
    
    var primaryButtonBackground: Color { get }
    var primaryButtonTextColor: Color { get }
}
