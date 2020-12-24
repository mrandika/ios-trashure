//
//  ExchangeStatus.swift
//  Trashure
//
//  Created by Andika on 12/3/20.
//

import SwiftUI

struct ExchangeStatus: View {
    var body: some View {
        ScrollView {
            VStack {
                LottieView(filename: "animation_success", loop: false)
                    .frame(width: 150, height: 150)
                
                Text(LocalizedStringKey("Success!"))
                    .fontWeight(.bold)
                    .lineLimit(2)
                    .font(.largeTitle)
                
                Text(LocalizedStringKey("Exchange Success"))
                    .fontWeight(.regular)
                    .foregroundColor(Color.gray)
                    .lineLimit(2)
                    .font(.body)
                    .padding(.top, 8)
                
                Text("Terima kasih telah melakukan penukaran saldo.\nSisa Saldo anda Rp. 144.000")
                    .fontWeight(.regular)
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .font(.body)
                    .padding(.top, 8)
            }.padding()
        }
    }
}

struct ExchangeStatus_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeStatus()
    }
}
