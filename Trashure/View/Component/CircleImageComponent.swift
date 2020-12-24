//
//  CircleImageComponent.swift
//  Trashure
//
//  Created by Andika on 11/28/20.
//

import SwiftUI

struct CircleImageComponent: View {
    
    var image: String
    
    var body: some View {
        Image(image)
            .resizable()
            .clipShape(Circle())
    }
}

struct CircleImageComponent_Previews: PreviewProvider {
    static var previews: some View {
        CircleImageComponent(image: "profile")
    }
}
