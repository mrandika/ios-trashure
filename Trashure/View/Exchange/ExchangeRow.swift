//
//  ExchangeRow.swift
//  Trashure
//
//  Created by Andika on 11/28/20.
//

import SwiftUI

struct ExchangeRow: View {
    var dataItem: ExchangeItem
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        HStack {
            Group {
                Group {
                    Image(dataItem.image)
                        .resizable()
                        .frame(width: 42, height: 42)
                }.frame(width: 64, height: 64)
                .background(colorScheme == .dark ? Color(UIColor.white) : nil)
                .cornerRadius(5)
            }
            .frame(alignment: .leading)
            .padding(.trailing, 16)
            
            Group {
                Text(dataItem.name)
            }.frame(maxWidth: .infinity, alignment: .leading)
            
            
        }.padding()
    }
}

struct ExchangeRow_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeRow(dataItem: ExchangeItem(image: "mobile-balance",
                      name: "Saldo Pulsa",
                      changes: [1000, 5000, 10000, 20000, 50000],
                      changeRates: [1500, 6000, 11000, 21000, 51000]
        ))
        
    }
}
