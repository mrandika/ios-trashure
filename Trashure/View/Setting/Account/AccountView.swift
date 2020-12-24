//
//  AccountView.swift
//  Trashure
//
//  Created by Andika on 11/29/20.
//

import SwiftUI

struct AccountView: View {
    
    @ObservedObject var authController: AuthController
    @State var showUpdateSheet: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                CircleImageComponent(image: "profile")
                    .frame(width: 90, height: 90)
                    .padding(.bottom, 8)
                
                Text(authController.firstName + " " + authController.lastName)
                    .font(.system(size: 18))
                    .padding(.bottom, 4)
                
                Text(authController.email)
                    .font(.system(size: 14))
                    .foregroundColor(Color(UIColor.gray))
                
                profileStatus()
            }.padding()
            
            List {
                Section(header: Text(LocalizedStringKey("Personal Data"))) {
                    HStack {
                        Text(LocalizedStringKey("First Name"))
                        Spacer()
                        Text($authController.firstName.wrappedValue)
                    }
                    
                    HStack {
                        Text(LocalizedStringKey("Last Name"))
                        Spacer()
                        Text($authController.lastName.wrappedValue)
                    }
                    
                    HStack {
                        Text(LocalizedStringKey("Email"))
                        Spacer()
                        Text($authController.email.wrappedValue)
                    }
                    
                    HStack {
                        Text(LocalizedStringKey("Phone Number"))
                        Spacer()
                        Text($authController.phone.wrappedValue)
                    }
                    
                    HStack {
                        Text(LocalizedStringKey("Birthday"))
                        Spacer()
                        Text("\(authController.birthday[0]) / \(authController.birthday[1]) / \(authController.birthday[2])")
                    }
                }
            }.scaledToFill()
        }
        .navigationBarTitle(LocalizedStringKey("Account"), displayMode: .inline)
        .navigationBarItems(trailing: Button(action: {
            showUpdateSheet.toggle()
        }) {
            Text(LocalizedStringKey("Edit"))
        }.sheet(isPresented: $showUpdateSheet) {
            NavigationView {
                AccountUpdateView(showUpdateSheet: $showUpdateSheet, authController: AuthController())
            }
        })
    }
}

struct profileStatus: View {
    var body: some View {
        return VStack {
            HStack {
                VStack {
                    Image("Crown")
                        .resizable()
                        .frame(width: 36, height: 36)
                    Text("Level")
                        .frame(maxWidth: .infinity)
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                }
                
                VStack {
                    Image("Card")
                        .resizable()
                        .frame(width: 36, height: 36)
                    Text(LocalizedStringKey("Balance"))
                        .frame(maxWidth: .infinity)
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                }
                
                VStack {
                    Image("Trash")
                        .resizable()
                        .frame(width: 36, height: 36)
                    Text("Total")
                        .frame(maxWidth: .infinity)
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                }
            }
            HStack {
                Text("Trashure Sejati")
                .fontWeight(.bold)
                .font(.system(size: 14))
                .foregroundColor(blueColor)
                .multilineTextAlignment(.center)
                .frame(minWidth: 0, maxWidth: .infinity)
                
                Text("Rp. 150,000")
                .fontWeight(.bold)
                .font(.system(size: 14))
                .foregroundColor(blueColor)
                .multilineTextAlignment(.center)
                .frame(minWidth: 0, maxWidth: .infinity)
                
                Text("24kg")
                .fontWeight(.bold)
                .font(.system(size: 14))
                .foregroundColor(blueColor)
                .multilineTextAlignment(.center)
                .frame(minWidth: 0, maxWidth: .infinity)
            }.padding(.top, 16.0)
        }
        .padding()
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(10)
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView(authController: AuthController())
    }
}
