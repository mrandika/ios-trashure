//
//  ExchangeDetailView.swift
//  Trashure
//
//  Created by Andika on 11/28/20.
//

import SwiftUI

struct ExchangeDetailView: View {
    var dataItem: ExchangeItem
    
    @State private var selectedRate = 0
    @State private var phoneNumber = ""
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            Form {
                Section {
                    TextField(LocalizedStringKey("Phone Number"), text: $phoneNumber)
                        .keyboardType(.numberPad)
                    
                    if phoneNumber.count >= 4 {
                        HStack {
                            Text(LocalizedStringKey("Provider"))
                            Spacer()
                            Group {
                                Image("provider-\(checkPrefix(prefix: phoneNumber))")
                                    .resizable()
                                    .scaledToFit()
                            }.frame(maxHeight: 30)
                            .background(colorScheme == .dark ? Color(UIColor.white) : nil)
                            .cornerRadius(5)
                        }
                    }
                    
                    Picker(selection: $selectedRate, label: Text(LocalizedStringKey("Nominal"))) {
                        ForEach(0 ..< dataItem.changes.count) { change in
                            Text("Rp \(dataItem.changes[change])")
                        }
                    }
                }
                
                Section {
                    HStack {
                        Text(LocalizedStringKey("Total"))
                        Spacer()
                        Text("Rp. \(dataItem.changeRates[selectedRate])")
                    }
                }
                
                Section {
                    NavigationLink(destination: ExchangeConfirmationView(dataItem: dataItem, service: dataItem.name, provider: checkPrefix(prefix: phoneNumber), phoneNumber: phoneNumber, selected: selectedRate
                    )) {
                        Text(LocalizedStringKey("Exchange"))
                            .bold()
                            .foregroundColor(redColor)
                    }
                }
            }
        }
        .navigationBarTitle(dataItem.name)
    }
}

struct ExchangeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeDetailView(dataItem: exchangeItem[0])
    }
}
