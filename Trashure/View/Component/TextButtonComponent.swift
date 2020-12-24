//
//  TextButtonComponent.swift
//  Trashure
//
//  Created by Andika on 11/22/20.
//

import SwiftUI

struct TextButtonComponent: View {
    
    var action: () -> Void
    var buttonText: LocalizedStringKey
    
    var body: some View {
        Button(action: action) {
            Text(buttonText)
                .font(.system(size: 14))
                .fontWeight(.medium)
                .foregroundColor(blueColor)
        }
    }
}

struct TextButtonComponent_Previews: PreviewProvider {
    static var previews: some View {
        TextButtonComponent(action: { print("test") }, buttonText: "Test Button")
    }
}
