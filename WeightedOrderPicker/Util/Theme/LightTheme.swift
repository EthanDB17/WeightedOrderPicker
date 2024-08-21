//
//  LightThemee.swift
//  WeightedOrderPicker
//
//  Created by Ethan Borrowman on 8/21/24.
//

import Foundation
import SwiftUI

struct LightTheme: ThemeElement {
    
    // MARK: - Backgrounds -
    
    var primaryBackground: Color {
        return Color.white
    }
        
    var secondaryBackground: Color {
        return Color.white
    }
    
    var fullScreenBlurColor: Color {
        return Color(hex: "ebeef0", opacity: 0.5)
    }
    
    // MARK: - Text Elements -
    
    var primaryFontColor: Color {
        return Color(UIColor.label)
    }
    
    // MARK: - Button Elements -
    
    var primaryButtonBackground: Color {
        return Color.blue.opacity(0.8)
    }
    var primaryButtonTextColor: Color {
        return Color.white
    }
}
