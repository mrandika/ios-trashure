//
//  TrashbagView.swift
//  Trashure
//
//  Created by Andika on 11/23/20.
//

import SwiftUI

struct TrashbagView: View {
    
    @ObservedObject var trashbagController = TrashbagController()
    
    @Binding var showSheet: Bool
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        VStack {
            LottieView(filename: "animation_warning", loop: true)
                .frame(width: 200, height: 200)
            
            Text(LocalizedStringKey("Old Trashbag Still Connected!"))
                .fontWeight(.bold)
                .lineLimit(4)
                .multilineTextAlignment(.center)
                .font(.largeTitle)
            
            Text("Trashbag dengan ID \(self.trashbagController.trashbagId ) masih tersambung. Putuskan sambungan untuk mengganti trashbag.")
                .fontWeight(.regular)
                .foregroundColor(Color.gray)
                .multilineTextAlignment(.center)
                .font(.body)
                .padding(.top, 8)
            
            Button(action: {
                trashbagController.trashbagId = ""
                showSheet = false
            }) {
                Text(LocalizedStringKey("Disconnect"))
                    .font(.headline)
                    .foregroundColor(Color(UIColor.white))
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(redColor)
                .cornerRadius(5)
            }.padding(.top, 16)
        }.padding()
    }
}

struct TrashbagView_Previews: PreviewProvider {
    static var previews: some View {
        TrashbagView(showSheet: .constant(true))
    }
}
