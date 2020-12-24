//
//  TipsModel.swift
//  Trashure
//
//  Created by Andika on 11/22/20.
//

import Foundation

struct TipsItem: Identifiable, Hashable {
    var id = UUID()
    var image: String
    var name: String
    var description: String
    var postDate: String
}
