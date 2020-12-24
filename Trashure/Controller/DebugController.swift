//
//  DebugController.swift
//  Trashure
//
//  Created by Andika on 12/5/20.
//

import Foundation

class DebugController: ObservableObject {
    @Published var balance: String {
        didSet {
            UserDefaults.standard.set(balance, forKey: "debug_balance")
        }
    }
    
    @Published var level: String {
        didSet {
            UserDefaults.standard.set(level, forKey: "debug_level")
        }
    }
    
    @Published var depositAvailable: Bool {
        didSet {
            UserDefaults.standard.set(depositAvailable, forKey: "debug_deposit-available")
        }
    }
    
    @Published var notificationAvailable: Bool {
        didSet {
            UserDefaults.standard.set(notificationAvailable, forKey: "debug_setoran-available")
        }
    }
    
    public var levelArray = ["Trashure Pemula", "Trashure Elit", "Trashure Sejati"]
    
    init() {
        self.balance = UserDefaults.standard.string(forKey: "debug_balance") ?? "150.000"
        self.level = UserDefaults.standard.string(forKey: "debug_level") ?? "Trashure Sejati"
        self.depositAvailable = UserDefaults.standard.object(forKey: "debug_deposit-available") as? Bool ?? true
        self.notificationAvailable = UserDefaults.standard.object(forKey: "debug_setoran-available") as? Bool ?? false
    }
}
