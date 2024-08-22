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
                    withAnimation(.easeOut.speed(1.5)) {
                        viewModel.dismiss()
                    }
                }, label: {
                    Image(systemName: "x.circle")
                        .tint(Theme.shared.primaryFontColor)
                        .font(Theme.shared.primaryFont(forSize: 17))
                })
                .background(Color.clear)
            }
            
            ThemedText("Enter Item Name", size: 24, weight: .semiBold, style: .title)
            
            HStack(alignment: .center) {
                ThemedText("\(viewModel.currentRank).")
                TextField("Name...", text: $viewModel.name)
                    .textFieldStyle(UnderlinedTextFieldStyle())
            }
            
            if DeviceType.shared.isIphone {
                iPhoneButtonStack()
            } else {
                iPadButtonStack()
            }
        }
        .padding(8)
        .background(Theme.shared.primaryBackgroundColor)
        .cornerRadius(8)
    }
    
    @ViewBuilder private func iPhoneButtonStack() -> some View {
        VStack {
            Button(action: {
                viewModel.saveAndEnterNext()
            }, label: {
                Text("Save and Continue")
                    .frame(minWidth: 250)
            })
            .buttonStyle(ThemedButtonStyle())
            
            Button(action: {
                withAnimation(.easeOut.speed(1.5)) {
                    viewModel.saveAndExit()
                }
            }, label: {
                Text("Save and Exit")
                    .frame(minWidth: 250)
            })
            .buttonStyle(ThemedButtonStyle())
        }
    }
    
    @ViewBuilder private func iPadButtonStack() -> some View {
        HStack(spacing: 16) {
            Button(action: {
                viewModel.saveAndEnterNext()
            }, label: {
                Text("Save and Continue")
                    .frame(minWidth: 250)
            })
            .buttonStyle(ThemedButtonStyle())
            
            Button(action: {
                viewModel.saveAndExit()
            }, label: {
                Text("Save and Exit")
                    .frame(minWidth: 250)
            })
            .buttonStyle(ThemedButtonStyle())
        }
        
    }
}

#Preview {
    ItemEntryView(viewModel: ItemEntryViewModel(currentRank: 1, delegate: nil))
}
