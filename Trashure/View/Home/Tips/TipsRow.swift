//
//  TipsRow.swift
//  Trashure
//
//  Created by Andika on 11/22/20.
//

import SwiftUI

struct TipsRow: View {
    var dataItem: TipsItem
    
    var body: some View {
        NavigationLink(destination: TipsDetail(dataItem: dataItem)) {
            VStack {
                ZStack(alignment: .bottomLeading) {
                    GeometryReader { geometry in
                        Image(dataItem.image)
                            .resizable(resizingMode: Image.ResizingMode.stretch)
                            .renderingMode(.original)
                            .aspectRatio(contentMode: .fill)
                            .frame(maxWidth: geometry.size.width)
                            .clipped()
                            .brightness(-0.25)
                    }
                    VStack(alignment: .leading) {
                        Text(dataItem.name)
                            .font(.system(size: 22))
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                    }
                    .frame(maxWidth: .infinity, alignment: .bottomLeading)
                    .padding(EdgeInsets.init(top: 16, leading: 16, bottom: 16, trailing: 16))
                }
                .background(Color.secondary)
                .cornerRadius(10)
                .padding(EdgeInsets.init(top: 8, leading: 0, bottom: 8, trailing: 0))
            }
        }
    }
}

struct TipsRow_Previews: PreviewProvider {
    static var previews: some View {
        TipsRow(dataItem: TipsItem(image: "tips-memilah", name: "Tips Memilah Sampah yang Baik", description: "Cara memilah sampah yang baik, hal yang pertama harus kamu lakuin adalah dengan cara mengetahui jenis-jenis sampah tersebut, mulai dari sampah kering, sampah basah. Sampah kering biasa nya terdiri dari sampah botol-botolan, kaleng-kalengan bekas minuman biasanya, sampah basah bisanya bekas sisa-sisa makanan. \nUntuk memilahnya, kami sarankan untuk mengelompokkannya menjadi dua kelompok, yang pertama sampah kering yang kedua sampah basah, disarankan untuk menyetor sampah kering saja, agar mudah ditimbang dan dihitung beratnya. \nJika anda mempunyai kardus, saran kami untuk memilah sampah kering tersebut menjadi beberapa kategori lagi, yang pertama sampah botol, yang kedua sampah kaleng dan yang terakhir adalah sampah kardus. Setelah itu masukkan sampah yang kalian pungut kedalam kardus-kardus yang sudah disediakan berdasarkan kategori yang sudah dibuat.", postDate: "17 April 2019"))
            .preferredColorScheme(.light)
    }
}
