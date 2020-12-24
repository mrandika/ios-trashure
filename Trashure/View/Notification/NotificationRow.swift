//
//  NotificationRow.swift
//  Trashure
//
//  Created by Andika on 11/29/20.
//

import SwiftUI

struct NotificationRow: View {
    var dataItem: NotificationMessage
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        HStack {
            Group {
                Image(dataItem.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 42, height: 42)
            }.frame(width: 64, height: 64)
            .background(colorScheme == .dark ? Color(UIColor.white) : nil)
            .cornerRadius(5)
            
            VStack(alignment: .leading) {
                HStack {
                    if dataItem.unread {
                        Text(dataItem.title).bold()
                    } else {
                        Text(dataItem.title)
                    }
                    
                    Spacer()
                    
                    Group {
                        if dataItem.unread {
                            Circle()
                                .foregroundColor(redColor)
                                .frame(width: 10, height: 10)
                        } else {
                            Text(dataItem.date.replacingOccurrences(of: " 2020", with: ""))
                                .font(.system(size: 10))
                                .foregroundColor(Color(UIColor.systemGray))
                        }
                    }.padding(.leading)
                }
                
                Text(dataItem.message)
                    .font(.system(size: 12))
                    .lineLimit(1)
                    .padding(.top, 4)
            }
        }
    }
}

struct NotificationRow_Previews: PreviewProvider {
    static var previews: some View {
        NotificationRow(dataItem: transactionMessage[0])
        NotificationRow(dataItem: transactionMessage[1])
    }
}
