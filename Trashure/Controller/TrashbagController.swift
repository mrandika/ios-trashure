//
//  TrashbagController.swift
//  Trashure
//
//  Created by Andika on 11/23/20.
//

import Foundation

class TrashbagController: ObservableObject {
    @Published var trashbagId: String {
        didSet {
            UserDefaults.standard.set(trashbagId, forKey: "trashbag_connected_id")
        }
    }
        
    init() {
        self.trashbagId = UserDefaults.standard.string(forKey: "trashbag_connected_id") ?? ""
    }
}
