//
//  AuthResetView.swift
//  Trashure
//
//  Created by Andika on 11/22/20.
//

import SwiftUI

struct AuthResetView: View {
    
    @EnvironmentObject var authController: AuthController
    
    @State var email: String = ""
    
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        ScrollView {
            VStack {
                LottieView(filename: "animation_confused", loop: true)
                    .frame(width: 300, height: 200)
                
                Text(LocalizedStringKey("Forgot Password"))
                    .fontWeight(.bold)
                    .lineLimit(2)
                    .font(.largeTitle)
                
                Text(LocalizedStringKey("Fill your email to reset the password"))
                    .fontWeight(.regular)
                    .foregroundColor(Color.gray)
                    .lineLimit(2)
                    .font(.body)
                    .padding(.top, 8)
                
                TextFieldComponent(imageName: "envelope.fill", textFieldLabel: "Email", value: $email, textFieldType: .emailAddress, secureField: false).padding(.top, 16)
                
                Group {
                    if authController.isOnProgress {
                        ActivityIndicatorComponent(isAnimating: .constant(true), style: .medium)
                    } else {
                        ButtonComponent(action: {
                            forgotTapped(email: email)
                        }, buttonText: LocalizedStringKey("Send Reset Email"))
                    }
                }.padding(.top, 32)
            }.padding()
        }
        .modifier(KeyboardAvoider())
    }
    private func forgotTapped(email: String) {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
        authController.resetPassword(email: email)
        
        do {
            sleep(2)
        }
        
        presentationMode.wrappedValue.dismiss()
    }
}

struct AuthResetView_Previews: PreviewProvider {
    static var previews: some View {
        AuthResetView().environmentObject(AuthController())
    }
}
