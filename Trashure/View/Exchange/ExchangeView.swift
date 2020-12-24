//
//  ExchangeView.swift
//  Trashure
//
//  Created by Andika on 11/28/20.
//

import SwiftUI

struct ExchangeView: View {
    
    var body: some View {
        NavigationView {
            List(exchangeItem, id: \.self) { item in
                NavigationLink(destination: ExchangeDetailView(dataItem: item)) {
                    ExchangeRow(dataItem: item)
                }
            }.listStyle(GroupedListStyle())
            .environment(\.horizontalSizeClass, .regular)
            .navigationBarTitle(LocalizedStringKey("Exchange"))
        }
    }
}

struct ExchangeView_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeView()
    }
}
