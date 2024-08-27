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
struct Theme: ThemeElement {
    
    static let current = Theme()
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
    
    // MARK: - Accents -
    
    var primaryAccentColor: Color {
        return currentTheme.primaryAccentColor
    }
    
    var destructiveAccentColor: Color {
        return currentTheme.destructiveAccentColor
    }
    
    // MARK: - Backgrounds -
    
    var primaryBackgroundColor: Color {
        return currentTheme.primaryBackgroundColor
    }
    var secondaryBackgroundColor: Color {
        return currentTheme.secondaryBackgroundColor
    }
    var fullScreenBlurColor: Color {
        return currentTheme.fullScreenBlurColor
    }
    
    // MARK: - Text Elements -
    
    var primaryFontColor: Color {
        return currentTheme.primaryFontColor
    }
    
    var accentElementFontColor: Color {
        return currentTheme.accentElementFontColor
    }
    
    // MARK: - Fonts -
    
    enum FontWeight {
        case regular
        case medium
        case semiBold
        case bold
        
        var name: String {
            switch self {
            case .regular: return "Montserrat-Regular"
            case .medium: return "Montserrat-Medium"
            case .semiBold: return "Montserrat-SemiBold"
            case .bold: return "Montserrat-Bold"
            }
        }
    }
    
    func primaryFont(forSize size: CGFloat, weight: FontWeight = .regular, textStyle: Font.TextStyle = .body) -> Font {
        return Font.custom(weight.name, size: size, relativeTo: textStyle)
    }
}
