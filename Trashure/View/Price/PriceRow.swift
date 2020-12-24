//
//  PriceRow.swift
//  Trashure
//
//  Created by Andika on 11/28/20.
//

import SwiftUI

struct PriceRow: View {
    
    var dataItem: ItemPrice
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomLeading) {
                GeometryReader { geometry in
                    Image(dataItem.image)
                        .resizable(resizingMode: Image.ResizingMode.stretch)
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: geometry.size.width)
                        .clipped()
                }
            }
            .background(Color.secondary)
            .cornerRadius(10)
            .padding(EdgeInsets.init(top: 8, leading: 0, bottom: 8, trailing: 0))
            .frame(height: 250)
            
            HStack {
                Group {
                    Text(dataItem.name)
                        .font(.headline)
                    .lineLimit(1)
                }.padding(EdgeInsets.init(top: 2, leading: 0, bottom: 0, trailing: 0))
                
                Spacer()
                
                Text("Rp. \(dataItem.price)/\(dataItem.priceByWeight)")
                .foregroundColor(orangeColor)
                .bold()
                .lineLimit(1)
                
            }
            .frame(maxWidth: .infinity, alignment: .bottomLeading)
        }.padding(.bottom, 8)
    }
}

struct PriceRow_Previews: PreviewProvider {
    static var previews: some View {
        PriceRow(dataItem: ItemPrice(image: "trash-plastic",
        name: "Sampah Plastik",
        description: "Polusi plastik adalah akumulasi dari produk plastik yang ada di lingkungan yang berdampak buruk terhadap satwa liar, habitat satwa liar, dan manusia. Plastik yang berperan sebagai polutan dikategorikan ke dalam mikro, meso, atau puing-puing makro, berdasarkan ukurannya.",
        price: 3500,
        priceByWeight: "kg"))
    }
}
