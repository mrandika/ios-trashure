//
//  ExchangeFactory.swift
//  Trashure
//
//  Created by Andika on 11/28/20.
//

import Foundation

let exchangeItem: [ExchangeItem] = [
    ExchangeItem(image: "mobile-balance",
                  name: "Saldo Pulsa",
                  changes: [1000, 5000, 10000, 20000, 50000],
                  changeRates: [1500, 6000, 11000, 21000, 51000]
    ),
    
    ExchangeItem(image: "dana-balance",
                  name: "Dana",
                  changes: [1000, 5000, 10000, 20000, 50000],
                  changeRates: [1500, 6000, 11000, 21000, 51000]
    ),
    
    ExchangeItem(image: "linkaja-balance",
                  name: "LinkAja",
                  changes: [1000, 5000, 10000, 20000, 50000],
                  changeRates: [1500, 6000, 11000, 21000, 51000]
    ),
    
    ExchangeItem(image: "gopay-balance",
                  name: "GoPay",
                  changes: [1000, 5000, 10000, 20000, 50000],
                  changeRates: [1500, 6000, 11000, 21000, 51000]
    ),
]
