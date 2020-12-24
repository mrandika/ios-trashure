//
//  SocialLoginButtonComponent.swift
//  Trashure
//
//  Created by Andika on 11/22/20.
//

import SwiftUI

struct SocialLoginButtonComponent: View {
    
    @State var comingSoonAlert: Bool = false
    
    var body: some View {
        VStack {
            Text(LocalizedStringKey("or login with"))
                .font(.system(size: 12))
                .foregroundColor(Color(UIColor.systemGray3))
            
            HStack {
                Button(action: {
                    //
                }) {
                    HStack {
                        Spacer()
                        Image("Google")
                            .resizable()
                            .frame(width: 30, height: 30)
                        Text("Google")
                            .font(.system(size: 14))
                            .foregroundColor(Color(UIColor.systemGray))
                        Spacer()
                    }.padding(.top, 8)
                    .padding(.bottom, 8)
                    .background(Color(UIColor.white))
                    .cornerRadius(5)
                    .padding(.trailing, 8)
                }
                
                Button(action: {
                    //
                }) {
                    HStack {
                        Spacer()
                        Image("Facebook")
                            .resizable()
                            .frame(width: 30, height: 30)
                        Text("Facebook")
                            .font(.system(size: 14))
                            .foregroundColor(Color(UIColor.systemGray))
                        Spacer()
                    }.padding(.top, 8)
                    .padding(.bottom, 8)
                    .cornerRadius(5)
                    .background(Color(UIColor.white))
                }
            }
        }
        .padding(.top, 8)
        .padding(.bottom, 24)
    }
}

struct SocialLoginButtonComponent_Previews: PreviewProvider {
    static var previews: some View {
        SocialLoginButtonComponent()
    }
}
