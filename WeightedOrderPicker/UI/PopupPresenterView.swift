//
//  PopupPresenterView.swift
//  WeightedOrderPicker
//
//  Created by Ethan Borrowman on 8/26/24.
//

import SwiftUI

struct PopupPresenterView: View {
    
    let popupType: PopupViewType
    
    var body: some View {
        ZStack {
            Theme.current.fullScreenBlurColor
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            
            switch popupType {
            case .itemEntryView(let viewModel):
                ItemEntryView(viewModel: viewModel)
                    .padding(.horizontal, 8)
            default:
                ThemedText("View Not Implemented")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
}

#Preview {
    PopupPresenterView(popupType: .itemEntryView(viewModel: ItemEntryViewModel(currentRank: 1, delegate: nil)))
}
