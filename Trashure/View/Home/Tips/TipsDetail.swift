//
//  TipsDetail.swift
//  Trashure
//
//  Created by Andika on 12/3/20.
//

import SwiftUI

struct TipsDetail: View {
    var dataItem: TipsItem
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(dataItem.name)
                    .font(.title)
                    .bold()
                
                Text(dataItem.postDate)
                    .font(.footnote)
                    .foregroundColor(Color(UIColor.systemGray))
                    .padding(.top, 16)
                
                Image(dataItem.image)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                
                Text(dataItem.description)
                    .font(.system(size: 16))
                    .padding(.top, 16)
            }
            .padding()
        }
        .navigationBarTitle("Tips", displayMode: .inline)
    }
}

struct TipsDetail_Previews: PreviewProvider {
    static var previews: some View {
        TipsDetail(dataItem: tipsItem[0])
    }
}
