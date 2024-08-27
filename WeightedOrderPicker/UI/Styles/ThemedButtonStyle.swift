//
//  ThemedButtonStyle.swift
//  WeightedOrderPicker
//
//  Created by Ethan Borrowman on 8/21/24.
//

import SwiftUI

/// Button style using themed background colors, fonts, and rounded corners
/// - parameter actionType: either standard or destructive, used to determine button background color
struct ThemedButtonStyle: ButtonStyle {
    
    enum ActionType {
        case standard
        case destructive
    }
    
    var actionType: ActionType = .standard
    var horizontalPadding: CGFloat = 8
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(Theme.current.primaryFont(forSize: 17, weight: .medium))
            .foregroundColor(Theme.current.accentElementFontColor)
            .padding(.vertical, 8)
            .padding(.horizontal, horizontalPadding)
            .background(colorForActionType())
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
    
    private func colorForActionType() -> Color {
        switch self.actionType {
        case .standard:
            return Theme.current.primaryAccentColor
        case .destructive:
            return Theme.current.destructiveAccentColor
        }
    }
}

#Preview {
    VStack {
        Button(action: {
            
        }, label: {
            Text("Standard Button")
        })
        .buttonStyle(ThemedButtonStyle())
        
        Button(action: {
            
        }, label: {
            Text("Destructive Button")
        })
        .buttonStyle(ThemedButtonStyle(actionType: .destructive))
    }
    
}
