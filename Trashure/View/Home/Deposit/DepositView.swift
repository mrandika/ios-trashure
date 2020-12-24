//
//  DepositView.swift
//  Trashure
//
//  Created by Andika on 11/22/20.
//

import SwiftUI

struct DepositView: View {
    let setoran = [false, true, true, true, true]
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(0 ..< setoran.count) { status in
                    DepositRow(completed: self.setoran[status])
                }
            }.padding()
        }
        .navigationBarTitle("Daftar Setoran", displayMode: .inline)
    }
}

struct DepositView_Previews: PreviewProvider {
    static var previews: some View {
        DepositView()
    }
}
