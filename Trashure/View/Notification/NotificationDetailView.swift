//
//  NotificationDetailView.swift
//  Trashure
//
//  Created by Andika on 11/29/20.
//

import SwiftUI

struct NotificationDetailView: View {
    var dataItem: NotificationMessage
    
    var body: some View {
        List {
            Section(header: Text("Pengirim")) {
                Text("Tim Trashure")
                Text("\(dataItem.date) pada \(dataItem.time)")
                    .font(.system(size: 12))
            }
            
            Section(header: Text("Pesan")) {
                Text(dataItem.title).bold()
                Text(dataItem.message).padding(.vertical)
            }
        }.listStyle(GroupedListStyle())
        .environment(\.horizontalSizeClass, .regular)
        .navigationBarTitle(Text("Pesan"), displayMode: .inline)
    }
}

struct NotificationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationDetailView(dataItem: transactionMessage[0])
        NotificationDetailView(dataItem: transactionMessage[1])
    }
}
