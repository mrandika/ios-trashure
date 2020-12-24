//
//  NotificationMessage.swift
//  Trashure
//
//  Created by Andika on 11/29/20.
//

import Foundation

struct NotificationMessage: Identifiable, Hashable {
    var id = UUID()
    var image: String
    var title: String
    var message: String
    var date: String
    var time: String
    var unread: Bool
}
