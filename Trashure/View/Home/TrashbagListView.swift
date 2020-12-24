//
//  TrashbagListView.swift
//  Trashure
//
//  Created by Andika on 11/22/20.
//

import SwiftUI

struct TrashbagListView: View {
    
    @ObservedObject var trashbagController = TrashbagController()
    
    var body: some View {
        if self.trashbagController.trashbagId == "" {
            Text("No trashbag connected")
        } else {
            Text("Trashbag Connected: \(self.trashbagController.trashbagId)")
        }
    }
}

struct TrashbagListView_Previews: PreviewProvider {
    static var previews: some View {
        TrashbagListView()
    }
}
