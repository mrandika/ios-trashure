//
//  AuthLoginView.swift
//  Trashure
//
//  Created by Andika on 11/22/20.
//

import SwiftUI

struct AuthLoginView: View {
    @EnvironmentObject var authController: AuthController
    
    @State var email: String = ""
    @State var password: String = ""
    
    @Environment(\.presentationMode) var presentationMode
    @State var showRegisterSheet: Bool = false
    @State var showResetPasswordSheet: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            Image("TrashureGreenIcon")
                .resizable()
                .frame(width: 76, height: 54)
            
            Text("Trashure")
                .fontWeight(.bold)
                .font(.largeTitle)
            
            TextFieldComponent(imageName: "envelope.fill", textFieldLabel: "Email", value: $email, textFieldType: .emailAddress, secureField: false).padding(.top, 32)
            
            TextFieldComponent(imageName: "lock.fill", textFieldLabel: LocalizedStringKey("Password"), value: $password, textFieldType: .password, secureField: true).padding(.top, 16)
            
            HStack {
                Spacer()
                
                TextButtonComponent(action: {
                    showResetPasswordSheet.toggle()
                }, buttonText: LocalizedStringKey("Forgot Password?"))
                .padding(.top, 10)
                .sheet(isPresented: $showResetPasswordSheet) {
                    AuthResetView().environmentObject(AuthController())
                }
            }
            
            Group {
                if authController.isAuthenticating {
                    ActivityIndicatorComponent(isAnimating: .constant(true), style: .medium)
                } else {
                    ButtonComponent(action: {
                        signInTapped(email: email, password: password)
                    }, buttonText: LocalizedStringKey("Login"))
                }
            }.padding(.top, 32)
            
            SocialLoginButtonComponent()
            
            HStack {
                Text(LocalizedStringKey("New member of Trashure?"))
                    .font(.system(size: 14))
                    .foregroundColor(Color(UIColor.systemGray))
                TextButtonComponent(action: {
                    showRegisterSheet.toggle()
                }, buttonText: LocalizedStringKey("Register Now!"))
                .sheet(isPresented: $showRegisterSheet) {
                    AuthRegisterView().environmentObject(AuthController())
                }
            }.padding(.top, 16)
            
            Spacer()
        }.padding()
        .modifier(KeyboardAvoider())
        .alert(isPresented: .constant(authController.isError)) {
            Alert(
                title: Text(LocalizedStringKey("Error")),
                message: Text("\(authController.error?.localizedDescription ?? "Terjadi kesalahan yang tidak diketahui pada saat melakukan autentikasi.")")
            )
        }
    }
    
    func signInTapped(email: String, password: String) {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        authController.login(email: email, password: password)
    }
}

struct AuthLoginView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["en", "id"], id: \.self) { id in
            AuthLoginView()
                .environmentObject(AuthController())
                .environment(\.locale, .init(identifier: id))
        }
    }
}
