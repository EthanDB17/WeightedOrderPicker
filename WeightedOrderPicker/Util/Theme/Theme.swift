//
//  Theme.swift
//  WeightedOrderPicker
//
//  Created by Ethan Borrowman on 8/21/24.
//

import Foundation
import SwiftUI
import UIKit

/// Singleton element containing application theme colors and fonts
struct Theme {
    
    static let shared = Theme()
    let lightTheme = LightTheme()
    // TODO: replace this when a dark theme element is created
    let darkTheme = LightTheme()
    
    private init() { }
    
    private var currentTheme: ThemeElement {
        switch UITraitCollection.current.userInterfaceStyle {
        case .dark: return self.darkTheme
        default: return self.lightTheme
        }
    }
    
    // MARK: - Backgrounds -
    
    var primaryBackground: Color {
        return currentTheme.primaryBackground
    }
    var secondaryBackground: Color {
        return currentTheme.secondaryBackground
    }
    var fullScreenBlurColor: Color {
        return currentTheme.fullScreenBlurColor
    }
    
    // MARK: - Text Elements -
    
    var primaryFontColor: Color {
        return currentTheme.primaryFontColor
    }
    
    // MARK: - Button Elements -
    
    var primaryButtonBackground: Color {
        return currentTheme.primaryButtonBackground
    }
    var primaryButtonTextColor: Color {
        return currentTheme.primaryButtonTextColor
    }
}
