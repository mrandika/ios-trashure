//
//  TextField.swift
//  Trashure
//
//  Created by Andika on 11/22/20.
//

import SwiftUI

struct TextFieldComponent: View {
    
    var imageName: String?
    var textFieldLabel: LocalizedStringKey
    var value: Binding<String>
    var textFieldType: UITextContentType?
    var secureField: Bool
    
    var body: some View {
        return HStack {
            if imageName != nil {
                Image(systemName: imageName ?? "").foregroundColor(Color(UIColor.systemGray2))
            }
            
            if secureField {
                SecureField(textFieldLabel, text: value)
                    .textContentType(textFieldType)
            } else {
                TextField(textFieldLabel, text: value)
                    .textContentType(textFieldType)
            }
            
        }
        .padding()
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 0.5))
    }
}

struct TextField_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldComponent(
            imageName: "envelope",
            textFieldLabel: "Email",
            value: .constant("email@domain.com"),
            textFieldType: .emailAddress,
            secureField: false
        )
        
        TextFieldComponent(
            imageName: "staroflife",
            textFieldLabel: "Password",
            value: .constant("password"),
            textFieldType: .password,
            secureField: true
        )
        
        TextFieldComponent(
            textFieldLabel: "Email",
            value: .constant("email@domain.com"),
            textFieldType: .emailAddress,
            secureField: false
        )
    }
}
