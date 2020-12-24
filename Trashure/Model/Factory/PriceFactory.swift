//
//  PriceFactory.swift
//  Trashure
//
//  Created by Andika on 11/28/20.
//

import Foundation

let itemPrice: [ItemPrice] = [
    ItemPrice(image: "trash-plastic",
              name: "Sampah Plastik",
              description: "Polusi plastik adalah akumulasi dari produk plastik yang ada di lingkungan yang berdampak buruk terhadap satwa liar, habitat satwa liar, dan manusia. Plastik yang berperan sebagai polutan dikategorikan ke dalam mikro, meso, atau puing-puing makro, berdasarkan ukurannya.",
              price: 3500,
              priceByWeight: "kg"),
    
    ItemPrice(image: "trash-cans",
              name: "Sampah Kaleng",
              description: "Kaleng adalah lembaran baja yang disalut timah. Bagi orang awam, kaleng sering diartikan sebagai tempat penyimpanan atau wadah yang terbuat dari logam dan digunakan untuk mengemas makanan, minuman, atau produk lain. Dalam pengertian ini, kaleng juga termasuk wadah yang terbuat dari aluminium.",
              price: 5000,
              priceByWeight: "kg"),
    
    ItemPrice(image: "trash-board",
              name: "Sampah Kardus",
              description: "Karton atau dalam bahasa inggris dikenal sebagai Paperboard adalah Material yang terbuat dari pulp, baik pulp organik, pulp sintetis atau sisa produksi kertas (daur ulang). Merujuk pada ISO 536, sebuah material yang terbuat dari kertas dengan berat lebih dari 200 g/m2 dikategorikan sebagai karton.",
              price: 4000,
              priceByWeight: "kg")
]
