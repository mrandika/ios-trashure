//
//  AuthRegisterView.swift
//  Trashure
//
//  Created by Andika on 11/22/20.
//

import SwiftUI

struct AuthRegisterView: View {
    
    @EnvironmentObject var authController: AuthController
    @Environment(\.presentationMode) private var presentationMode
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State var phone: String = ""
    @State var password: String = ""
    
    @State var dob: String = ""
    @State var mob: String = ""
    @State var yob: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                LottieView(filename: "animation_hello", loop: true)
                    .frame(width: 300, height: 200)
                
                Text(LocalizedStringKey("Join Trashure"))
                    .fontWeight(.bold)
                    .lineLimit(2)
                    .font(.largeTitle)
                
                Text(LocalizedStringKey("Register now for more benefit!"))
                    .fontWeight(.regular)
                    .foregroundColor(Color.gray)
                    .lineLimit(2)
                    .font(.body)
                    .padding(.top, 8)
                
                TextFieldComponent(imageName: "person.fill", textFieldLabel: LocalizedStringKey("First Name"), value: $firstName, textFieldType: .name, secureField: false).padding(.top, 32)
                
                TextFieldComponent(textFieldLabel: LocalizedStringKey("Last Name"), value: $lastName, textFieldType: .name, secureField: false).padding(.top, 16)
                
                TextFieldComponent(imageName: "phone.fill", textFieldLabel: LocalizedStringKey("Phone Number"), value: $phone, textFieldType: .name, secureField: false).padding(.top, 16)
                    .keyboardType(.numberPad)
                
                TextFieldComponent(imageName: "envelope.fill", textFieldLabel: "Email", value: $email, textFieldType: .emailAddress, secureField: false).padding(.top, 16)
                
                TextFieldComponent(imageName: "staroflife.fill", textFieldLabel: LocalizedStringKey("Password"), value: $password, textFieldType: .newPassword, secureField: true).padding(.top, 16)
                
                HStack {
                    TextFieldComponent(imageName: "calendar", textFieldLabel: LocalizedStringKey("Day"), value: $dob, textFieldType: .none, secureField: false)
                    
                    TextFieldComponent(textFieldLabel: LocalizedStringKey("Month"), value: $mob, textFieldType: .none, secureField: false)
                    
                    TextFieldComponent(textFieldLabel: LocalizedStringKey("Year"), value: $yob, textFieldType: .none, secureField: false)
                }.keyboardType(.numberPad)
                .padding(.top, 16)
                
                Group {
                    if authController.isAuthenticating {
                        ActivityIndicatorComponent(isAnimating: .constant(true), style: .medium)
                    } else {
                        ButtonComponent(action: {
                            signUpTapped(firstName: firstName, lastName: lastName, email: email, phone: phone, password: password, dob: [dob, mob, yob])
                        }, buttonText: LocalizedStringKey("Register")).padding(.top, 32)
                    }
                }.padding(.top, 16)
                
            }.padding()
            .alert(isPresented: .constant(authController.isError)) {
                Alert(
                    title: Text(LocalizedStringKey("Error")),
                    message: Text("\(authController.error?.localizedDescription ?? "Terjadi kesalahan yang tidak diketahui pada saat melakukan autentikasi.")")
                )
            }
        }
        .modifier(KeyboardAvoider())
    }
    private func signUpTapped(firstName: String, lastName: String, email: String, phone: String, password: String, dob: Array<String>) {
        authController.register(firstName: firstName, lastName: lastName, email: email, password: password, phone: phone, dob: dob)
        
        DispatchQueue.main.async {
            do {
                sleep(3)
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

struct AuthRegisterView_Previews: PreviewProvider {
    static var previews: some View {
        AuthRegisterView()
            .environmentObject(AuthController())
    }
}
