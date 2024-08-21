//
//  UnderlinedTextFieldStyle.swift
//  WeightedOrderPicker
//
//  Created by Ethan Borrowman on 8/21/24.
//

import SwiftUI

struct UnderlinedTextFieldStyle: TextFieldStyle {
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
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
