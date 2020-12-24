//
//  ExchangeConfirmationView.swift
//  Trashure
//
//  Created by Andika on 11/29/20.
//

import SwiftUI

struct ExchangeConfirmationView: View {
    var dataItem: ExchangeItem
    
    var service: String
    var provider: String
    var phoneNumber: String
    var selected: Int
    
    @Environment(\.presentationMode) var presentationMode
    @State var showStatusSheet: Bool = false
    
    var body: some View {
        VStack {
            Form {
                Section {
                    HStack {
                        Text(LocalizedStringKey("Service"))
                        Spacer()
                        Text("Penukaran \(service)")
                    }
                }
                
                Section {
                    HStack {
                        Text(LocalizedStringKey("Provider"))
                        Spacer()
                        Text(provider)
                    }
                    HStack {
                        Text(LocalizedStringKey("Phone Number"))
                        Spacer()
                        Text(phoneNumber)
                    }
                    HStack {
                        Text(service)
                        Spacer()
                        Text("Rp \(dataItem.changes[selected])")
                    }
                }
                
                Section {
                    HStack {
                        Text(LocalizedStringKey("Total Price"))
                        Spacer()
                        Text("Rp \(dataItem.changeRates[selected])")
                    }
                }
                
                Section {
                    Button (action: {
                        self.showStatusSheet.toggle()
                    }) {
                        Text(LocalizedStringKey("Exchange"))
                            .bold()
                            .foregroundColor(redColor)
                    }
                }
            }
        }.navigationBarTitle(LocalizedStringKey("Confirmation"))
        .sheet(isPresented: $showStatusSheet) {
            ExchangeStatus()
        }
    }
}

struct ExchangeConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeConfirmationView(dataItem: exchangeItem[0], service: "Saldo Pulsa", provider: "TSEL", phoneNumber: "081221047289", selected: 0)
    }
}
