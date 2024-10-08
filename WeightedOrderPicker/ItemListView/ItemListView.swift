//
//  ItemListView.swift
//  WeightedOrderPicker
//
//  Created by Ethan Borrowman on 8/18/24.
//

import SwiftUI

struct ItemListView: View {
    
    @State var viewModel: ItemListViewModel
    
    var body: some View {
        ZStack {
            VStack {
                headerBar()
                
                if viewModel.items.isEmpty {
                    if viewModel.popupViewType == nil {
                        emptyView()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    } else {
                        Spacer()
                            .frame(maxHeight: .infinity)
                    }
                } else {
                    NavigationStack {
                        VStack {
                            elementList()
                            NavigationLink("Generate Weighted Order", value: viewModel.items)
                                .buttonStyle(ThemedButtonStyle(horizontalPadding: 16))
                        }
                        .blur(radius: viewModel.popupViewType != nil ? 1 : 0)
                        .navigationDestination(for: [ListItem].self) { items in
                            OrderedItemListView(viewModel: OrderedItemListViewModel(startingList: items))
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Theme.current.primaryBackgroundColor)
            
            if let popuptype = viewModel.popupViewType {
                PopupPresenterView(popupType: popuptype)
                    .transition(.opacity)
            }
        }
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
            withAnimation(.easeIn.speed(1.5)) {
                viewModel.presentItemEntryPopup()
            }
        }, label: {
            ThemedText("+ Tap To Add Items", size: 20, weight: .semiBold)
                .foregroundStyle(Theme.current.primaryAccentColor)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        })
    }
    
    @ViewBuilder private func elementList() -> some View {
        List {
            ForEach(viewModel.items, id: \.weight) { item in
                ThemedText("\(item.weight): \(item.name)")
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    ItemListView(viewModel: ItemListViewModel())
}
