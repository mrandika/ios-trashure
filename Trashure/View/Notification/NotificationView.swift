//
//  NotificationView.swift
//  Trashure
//
//  Created by Andika on 11/29/20.
//

import SwiftUI

struct NotificationView: View {
    
    @Binding var showNotificationSheet: Bool
    @State var selection = 0
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        VStack {
            Picker("Tipe Notifikasi", selection: $selection) {
                Text(LocalizedStringKey("Notification")).tag(0)
                Text(LocalizedStringKey("Other")).tag(1)
            }.pickerStyle(SegmentedPickerStyle())
            .padding()
            
            List(selection == 0 ? transactionMessage : otherMessage, id: \.self) { item in
                NavigationLink(destination: NotificationDetailView(dataItem: item)) {
                    NotificationRow(dataItem: item)
                }
            }
        }
        .navigationBarTitle(Text(LocalizedStringKey("Notification")), displayMode: .inline)
        .navigationBarItems(trailing: Button(action: {
            self.showNotificationSheet = false
        }) {
            Text(LocalizedStringKey("Done")).bold()
        })
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView(showNotificationSheet: .constant(true))
    }
}
