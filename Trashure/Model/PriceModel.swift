//
//  PriceModel.swift
//  Trashure
//
//  Created by Andika on 11/28/20.
//

import Foundation

struct ItemPrice: Identifiable, Hashable {
    var id = UUID()
    var image: String
    var name: String
    var description: String
    var price: Int
    var priceByWeight: String
}
