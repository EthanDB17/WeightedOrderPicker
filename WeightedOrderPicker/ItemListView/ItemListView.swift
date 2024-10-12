//
//  ItemListView.swift
//  WeightedOrderPicker
//
//  Created by Ethan Borrowman on 8/18/24.
//

import SwiftUI

struct ItemListView: View {
    
    @State var viewModel: ItemListViewModel
    @Namespace private var entryListAnimation
    
    let itemEntryId = "ItemEntryId"
    
    var body: some View {
        VStack(spacing: 0) {
             headerBar()
             
             ZStack {
                if viewModel.items.isEmpty {
                    if viewModel.popupViewType == nil {
                        emptyView()
                            .matchedGeometryEffect(id: itemEntryId, in: entryListAnimation)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    } else {
                        Spacer()
                            .frame(maxHeight: .infinity)
                    }
                } else {
                    NavigationStack {
                        VStack {
                            elementList()
                                .frame(maxHeight: .infinity)
                                .transition(.slide.animation(.easeInOut))
                            VStack {
                                NavigationLink("Generate Weighted Order", value: viewModel.items)
                                    .buttonStyle(ThemedButtonStyle(horizontalPadding: 16))
                            }
                            
                        }
                        .blur(radius: viewModel.popupViewType != nil ? 1 : 0)
                        .navigationDestination(for: [ListItem].self) { items in
                            OrderedItemListView(viewModel: OrderedItemListViewModel(startingList: items))
                        }
                        .frame(maxHeight: .infinity)
                    }
                    .animation(.bouncy, value: viewModel.items)
                }
                 
                 if let popuptype = viewModel.popupViewType {
                     PopupPresenterView(popupType: popuptype)
                         .matchedGeometryEffect(id: itemEntryId, in: entryListAnimation)
                 }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Theme.current.primaryBackgroundColor)
        }
        .animation(.easeInOut, value: viewModel.popupViewType)
    }
    
    @ViewBuilder private func headerBar() -> some View {
        HStack {
            Button(action: {
                // TODO: Show info popup
            }, label: {
                Image(systemName: "info.circle")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .tint(Theme.current.accentElementFontColor)
                    .padding(.horizontal, 8)
            })
            
            ThemedText("Initial Ordered List", size: 24, weight: .bold, style: .title)
                .frame(maxWidth: .infinity)
                .foregroundStyle(Theme.current.accentElementFontColor)
            
            Button(action: {
                // TODO: Show alert sheet
            }, label: {
                Image(systemName: "ellipsis")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .tint(Theme.current.accentElementFontColor)
                    .padding(.horizontal, 8)
                    .rotationEffect(.degrees(90))
            })
        }
        .frame(maxWidth: .infinity, minHeight: 40)
        .background(Theme.current.primaryAccentColor)
    }
    
    @ViewBuilder private func emptyView() -> some View {
        Button(action: {
            viewModel.presentItemEntryPopup()
        }, label: {
            ThemedText("+ Tap To Add Items", size: 20, weight: .semiBold)
                .foregroundStyle(Theme.current.primaryAccentColor)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        })
    }
    
    @ViewBuilder private func elementList() -> some View {
        VStack(alignment: .leading, spacing: 8) {
            ForEach(viewModel.items, id: \.weight) { item in
                ThemedText("\(item.weight): \(item.name)")
                    .frame(height: 30)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .transition(.slide.animation(.easeInOut))
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ItemListView(viewModel: ItemListViewModel())
}
