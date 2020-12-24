//
//  PriceView.swift
//  Trashure
//
//  Created by Andika on 11/28/20.
//

import SwiftUI

struct PriceView: View {
    
    var body: some View {
        NavigationView {
            List(itemPrice) { price in
                PriceRow(dataItem: price)
            }
            .navigationBarTitle(LocalizedStringKey("Price"))
        }
    }
}

struct PriceView_Previews: PreviewProvider {
    static var previews: some View {
        PriceView()
    }
}
