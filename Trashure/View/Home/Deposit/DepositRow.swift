//
//  DepositRow.swift
//  Trashure
//
//  Created by Andika on 11/22/20.
//

import Foundation

import SwiftUI

struct DepositRow: View {
    var completed: Bool
    
    var body: some View {
        HStack {
            
            Group {
                Image("TrashWhiteIcon")
                    .resizable()
                    .frame(width: 42, height: 42)
            }.frame(width: 64, height: 64)
            .background(Color(UIColor.systemGreen))
            .cornerRadius(5)
            
            
            VStack(alignment: .leading) {
                Text("TrashbagID \(randomNameString())")
                    .multilineTextAlignment(.leading)
                Text(getDate())
                    .font(.callout)
                    .multilineTextAlignment(.leading)
                    
                    .padding(.top, 8.0)
            }.padding(.leading, 8)
            
            Spacer()
            
            Group {
                if completed {
                   Text(LocalizedStringKey("Done"))
                    .foregroundColor(greenColor)
                } else {
                    Text(LocalizedStringKey("On Process"))
                        .foregroundColor(Color(UIColor.systemYellow))
                }
            }.padding(8.0)
            .background(Color.white)
            .cornerRadius(12)
            
        }.padding()
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(12)
        
    }
    
    private func getDate() -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd / MM / yyyy"
        
        return dateFormatter.string(from: date)
    }
    
    private func randomNameString(length: Int = 5) -> String {
        
        enum s {
            static let c = Array("abcdefghjklmnpqrstuvwxyz12345789")
            static let k = UInt32(c.count)
        }
        
        var result = [Character](repeating: "-", count: length)
        
        for i in 0..<length {
            let r = Int(arc4random_uniform(s.k))
            result[i] = s.c[r]
        }
        
        return String(result).uppercased()
    }
}

struct DepositRow_Previews: PreviewProvider {
    static var previews: some View {
        DepositRow(completed: true)
    }
}
