//
//  ItemEntryView.swift
//  WeightedOrderPicker
//
//  Created by Ethan Borrowman on 8/18/24.
//

import SwiftUI

struct ItemEntryView: View {
    
    @State var viewModel: ItemEntryViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Spacer()
                Button(action: {
                    viewModel.dismiss()
                }, label: {
                    Image(systemName: "x.circle")
                        .tint(Theme.shared.primaryFontColor)
                })
                .background(Color.clear)
            }
            
            Text("Enter Item Name")
                .font(.title)
            
            HStack(alignment: .center) {
                Text("\(viewModel.currentRank).")
                TextField("Name...", text: $viewModel.name)
                    .textFieldStyle(UnderlinedTextFieldStyle())
            }
            
            Button(action: {
                viewModel.saveAndEnterNext()
            }, label: {
                Text("Save and Continue")
            })
            
            Button(action: {
                viewModel.saveAndExit()
            }, label: {
                Text("Save and Exit")
            })
        }
        .padding(8)
        .background(Theme.shared.primaryBackground)
        .cornerRadius(8)
    }
}

#Preview {
    ItemEntryView(viewModel: ItemEntryViewModel(currentRank: 1, delegate: nil))
}
