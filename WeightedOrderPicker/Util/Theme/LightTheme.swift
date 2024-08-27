//
//  LightThemee.swift
//  WeightedOrderPicker
//
//  Created by Ethan Borrowman on 8/21/24.
//

import Foundation
import SwiftUI

struct LightTheme: ThemeElement {
    
    // MARK: - Accents -
    
    var primaryAccentColor: Color {
        return Color(hex: "4097da", opacity: 0.8)
    }
    
    var destructiveAccentColor: Color {
        return Color(hex: "e64c3c", opacity: 0.8)
    }
    
    // MARK: - Backgrounds -
    
    var primaryBackgroundColor: Color {
        return Color.white
    }
        
    var secondaryBackgroundColor: Color {
        return Color.white
    }
    
    var fullScreenBlurColor: Color {
        return Color(hex: "606c7a", opacity: 0.7)
    }
    
    // MARK: - Text Elements -
    
    var primaryFontColor: Color {
        return Color(UIColor.label)
    }
    
    var accentElementFontColor: Color {
        return Color.white
    }
}
