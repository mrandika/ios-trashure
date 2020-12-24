//
//  ExchangeModel.swift
//  Trashure
//
//  Created by Andika on 11/28/20.
//

import Foundation

struct ExchangeItem: Identifiable, Hashable {
    var id = UUID()
    var image: String
    var name: String
    var changes = [Int]()
    var changeRates = [Int]()
}
