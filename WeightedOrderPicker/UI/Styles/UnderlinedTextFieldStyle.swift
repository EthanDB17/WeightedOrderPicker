//
//  UnderlinedTextFieldStyle.swift
//  WeightedOrderPicker
//
//  Created by Ethan Borrowman on 8/21/24.
//

import SwiftUI

/// Text field style with an underline
struct UnderlinedTextFieldStyle: TextFieldStyle {
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .font(Theme.shared.primaryFont(forSize: 17))
            .padding(.vertical, 8)
            .background(
                VStack {
                    Spacer()
                    Color(UIColor.placeholderText)
                        .frame(height: 2)
                }
            )
    }
    
}

#Preview {
    TextField("Placeholder...", text: .constant(""))
        .textFieldStyle(UnderlinedTextFieldStyle())
}
