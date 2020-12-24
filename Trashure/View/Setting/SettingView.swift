//
//  SettingView.swift
//  Trashure
//
//  Created by Andika on 11/28/20.
//

import SwiftUI

struct SettingView: View {
    
    @ObservedObject var authController: AuthController
    
    let settingsTopComponent = [
        ["text.bubble.fill", "Language"],
        ["bell.fill", "Notification"],
    ]
    
    let settingsLowerComponent = [
        ["questionmark.circle.fill", "Help"],
        ["lock.shield.fill", "Privacy Policy"],
        ["a.book.closed.fill", "Terms of Service"],
        ["star.fill", "Give us Star"],
    ]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    NavigationLink(destination: AccountView(authController: AuthController())) {
                        HStack {
                            CircleImageComponent(image: "profile")
                                .frame(width: 70, height: 70)
                            
                            VStack(alignment: .leading) {
                                Text(authController.firstName + " " + authController.lastName)
                                    .font(.system(size: 18))
                                Text(LocalizedStringKey("Account, Membership & History"))
                                    .font(.system(size: 12))
                                    .padding(.top, 2)
                            }.padding(.leading)
                        }.padding(.vertical, 8)
                    }
                }
                
                Section {
                    NavigationLink(destination: DebugView()) {
                        HStack {
                            Image(systemName: "hammer.fill")
                                .resizable()
                                .frame(width: 20, height: 20)
                            
                            Text(LocalizedStringKey("Debug Menu")).padding(.leading)
                        }.padding(.vertical, 8)
                    }
                }
                
                Section {
                    ForEach(settingsTopComponent, id: \.self) { item in
                        NavigationLink(destination: Text(item[1])) {
                            HStack {
                                Image(systemName: item[0])
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                
                                Text(LocalizedStringKey(item[1])).padding(.leading)
                            }.padding(.vertical, 8)
                        }
                    }
                }
                
                Section {
                    ForEach(settingsLowerComponent, id: \.self) { item in
                        NavigationLink(destination: Text(item[1])) {
                            HStack {
                                Image(systemName: item[0])
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                
                                Text(LocalizedStringKey(item[1])).padding(.leading)
                            }.padding(.vertical, 8)
                        }
                    }
                }
                
                Section {
                    if authController.isOnProgress {
                        ActivityIndicatorComponent(isAnimating: .constant(true), style: .medium).frame(maxWidth: .infinity)
                    } else {
                        Button(LocalizedStringKey("Signout"), action: {
                            authController.signout()
                        })
                        .foregroundColor(redColor)
                        .frame(maxWidth: .infinity)
                    }
                }
                
            }.listStyle(GroupedListStyle())
            .environment(\.horizontalSizeClass, .regular)
            .navigationBarTitle(LocalizedStringKey("Setting"))
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView(authController: AuthController())
    }
}
