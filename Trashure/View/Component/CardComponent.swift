//
//  CardComponent.swift
//  Trashure
//
//  Created by Andika on 11/22/20.
//

import SwiftUI

struct CardComponent: View {
    
    var image: String
    var status: String
    var title: LocalizedStringKey
    var value: String
    var subtitle: LocalizedStringKey
    
    var showTime: Bool
    var showChevron: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 6) {
                Group {
                    Image(systemName: image)
                    Text(title)
                        .font(.headline)
                }
                .foregroundColor(greenColor)
                
                Spacer()
                
                Group {
                    if showTime {
                        Text(status)
                    }
                    
                    if showChevron {
                        Image(systemName: "chevron.right")
                    }
                }
                .font(.callout)
                .foregroundColor(.secondary)
            }
            
            HStack(alignment: .firstTextBaseline, spacing: 4) {
                Text(value)
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.semibold)
                Text(subtitle)
                    .font(.headline)
                    .foregroundColor(.secondary)
                Spacer()
            }.padding(.top, 8)
        }
        .padding()
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(12)
    }
}

struct CardComponent_Previews: PreviewProvider {
    static var previews: some View {
        CardComponent(image: "creditcard.fill", status: "time", title: "Saldo", value: "150.000", subtitle: "rupiah", showTime: true, showChevron: false)
        CardComponent(image: "link", status: "time", title: "Trashbag", value: "1", subtitle: "terhubung", showTime: false, showChevron: true)
    }
}
