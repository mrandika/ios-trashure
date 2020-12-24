//
//  DebugView.swift
//  Trashure
//
//  Created by Andika on 12/5/20.
//

import SwiftUI

struct DebugView: View {
    
    @ObservedObject var debugController = DebugController()
    
    var body: some View {
        Form {
            Section(header: Text("Profile Menu")) {
                TextField("Balance", text: $debugController.balance)
                
                Picker(selection: $debugController.level, label: Text("Level")) {
                    ForEach(debugController.levelArray, id: \.self) { level in
                        Text(level)
                    }
                }
            }
            
            Section(footer: Text("Mengaktifkan List Setoran (Deposit) pada HomeView. Jika false, maka akan menampilkan text. Default: true.")) {
                Toggle(isOn: $debugController.depositAvailable) {
                    Text("Deposit List")
                }
            }
            
            Section(footer: Text("Mengaktifkan badge notification pada HomeView. Jika true, maka akan mengganti icon navigation bar ke bell.badge Default: false.")) {
                Toggle(isOn: $debugController.notificationAvailable) {
                    Text("Notification Badge")
                }
            }
        }
        .navigationBarTitle("Debug", displayMode: .inline)
    }
}

struct DebugView_Previews: PreviewProvider {
    static var previews: some View {
        DebugView()
    }
}
