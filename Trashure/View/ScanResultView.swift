//
//  ScanResultView.swift
//  Trashure
//
//  Created by Andika on 11/23/20.
//

import SwiftUI

struct ScanResultView: View {
    
    @ObservedObject var trashbagController = TrashbagController()
    @Binding var showSheet: Bool
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        ScrollView {
            VStack {
                LottieView(filename: "animation_success", loop: false)
                    .frame(width: 150, height: 150)
                
                Text(LocalizedStringKey("Success!"))
                    .fontWeight(.bold)
                    .lineLimit(2)
                    .font(.largeTitle)
                
                Text(LocalizedStringKey("Trashbag Connected"))
                    .fontWeight(.regular)
                    .foregroundColor(Color.gray)
                    .lineLimit(2)
                    .font(.body)
                    .padding(.top, 8)
                
                Text("Trashbag ID: \(self.trashbagController.trashbagId)")
                    .fontWeight(.regular)
                    .foregroundColor(Color.gray)
                    .lineLimit(2)
                    .font(.body)
                    .padding(.top, 8)
            }.padding()
        }
    }
}

struct ScanResultView_Previews: PreviewProvider {
    static var previews: some View {
        ScanResultView(showSheet: .constant(true))
    }
}
