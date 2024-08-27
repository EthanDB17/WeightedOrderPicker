//
//  ThemedText.swift
//  WeightedOrderPicker
//
//  Created by Ethan Borrowman on 8/21/24.
//

import SwiftUI

struct ThemedText: View {
    let text: String
    let size: CGFloat
    let weight: Theme.FontWeight
    let style: Font.TextStyle
    
    init(_ text: String, size: CGFloat = 17, weight: Theme.FontWeight = .regular, style: Font.TextStyle = .body) {
        self.text = text
        self.size = size
        self.weight = weight
        self.style = style
    }
    
    var body: some View {
        Text(text)
            .font(Theme.current.primaryFont(forSize: size, weight: self.weight, textStyle: self.style))
    }
}

#Preview {
    VStack {
        ThemedText("Regular Text")
        ThemedText("SemiBold Text", weight: .semiBold)
        ThemedText("Bold Text", weight: .bold)
        ThemedText("Bold Title Text", size: 24, weight: .bold, style: .title)
    }
}
