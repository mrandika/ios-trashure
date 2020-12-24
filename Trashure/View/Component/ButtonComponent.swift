//
//  ButtonComponent.swift
//  Trashure
//
//  Created by Andika on 11/22/20.
//

import SwiftUI

struct ButtonComponent: View {
    
    var action: () -> Void
    var buttonText: LocalizedStringKey
    
    var body: some View {
        Button(action: action) {
            Text(buttonText)
                .font(.headline)
                .foregroundColor(Color(UIColor.white))
                .padding()
                .frame(maxWidth: .infinity)
                .background(greenColor)
            .cornerRadius(5)
        }
    }
}

struct ButtonComponent_Previews: PreviewProvider {
    static var previews: some View {
        ButtonComponent(action: { print("test") }, buttonText: "Test Button")
    }
}
