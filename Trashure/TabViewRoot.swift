//
//  TabViewRoot.swift
//  Trashure
//
//  Created by Andika on 11/22/20.
//

import SwiftUI

struct TabViewRoot: View {
    @ObservedObject var trashbagController = TrashbagController()
    
    @State private var selection = 0
    
    var body: some View {
        TabView(selection: $selection) {
            HomeView().tag(0)
                .tabItem {
                    Image(systemName: selection == 0 ? "house.fill" : "house")
                    Text(LocalizedStringKey("Home"))
            }
            
            ExchangeView().tag(1)
                .tabItem {
                    Image(systemName: "arrow.2.squarepath")
                    Text(LocalizedStringKey("Exchange"))
            }
            
            ScannerView().tag(2)
                .tabItem {
                    Image(systemName: "qrcode.viewfinder")
                    Text("Scan")
            }
            
            PriceView().tag(3)
                .tabItem {
                    Image(systemName: selection == 3 ? "tag.fill" : "tag")
                    Text(LocalizedStringKey("Price"))
            }
            
            SettingView(authController: AuthController()).tag(4)
                .tabItem {
                    Image(systemName: "gear")
                    Text(LocalizedStringKey("Setting"))
            }
        }
    }
}

struct TabViewRoot_Previews: PreviewProvider {
    static var previews: some View {
        TabViewRoot()
            .environmentObject(AuthController())
    }
}
