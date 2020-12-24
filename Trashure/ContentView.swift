//
//  ContentView.swift
//  Trashure
//
//  Created by Andika on 11/22/20.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var authController: AuthController
    
    var body: some View {
        Group {
            if authController.loggedInUser != nil || authController.checkAuth() {
                TabViewRoot()
            } else {
                AuthLoginView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
    }
}
