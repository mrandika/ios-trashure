//
//  AccountUpdateView.swift
//  Trashure
//
//  Created by Andika on 12/5/20.
//

import SwiftUI

struct AccountUpdateView: View {
    
    @Environment(\.presentationMode) private var presentationMode
    @Binding var showUpdateSheet: Bool
    
    @ObservedObject var authController: AuthController
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text(LocalizedStringKey("Personal Data"))) {
                    TextField(LocalizedStringKey("First Name"), text: $authController.firstName)
                    TextField(LocalizedStringKey("Last Name"), text: $authController.lastName)
                }
                
                Section(header: Text(LocalizedStringKey("Contact Data"))) {
                    TextField(LocalizedStringKey("Email"), text: $authController.email)
                    TextField(LocalizedStringKey("Phone Number"), text: $authController.phone)
                }
            }
        }
        .navigationBarTitle(LocalizedStringKey("Update Account"), displayMode: .inline)
        .navigationBarItems(trailing: Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Text("Done").bold()
        })
    }
}

struct AccountUpdateView_Previews: PreviewProvider {
    static var previews: some View {
        AccountUpdateView(showUpdateSheet: .constant(true), authController: AuthController())
    }
}
