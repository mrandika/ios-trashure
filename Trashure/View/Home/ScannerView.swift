//
//  ScannerView.swift
//  Trashure
//
//  Created by Andika on 11/23/20.
//

import SwiftUI
import CarBode
import AVFoundation

struct ScannerView: View {
    
    enum ActiveSheet {
       case scanned, alreadyScanned
    }
    
    @ObservedObject var trashbagController = TrashbagController()
    
    @State private var activeSheet: ActiveSheet = .alreadyScanned
    @State var flashlightOn: Bool = false
    @State var showSheet: Bool = false
    @State var qrContent: String = ""
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                CBScanner(
                    supportBarcode: .constant([.qr]),
                    torchLightIsOn: $flashlightOn,
                    scanInterval: .constant(2.5),
                    mockBarCode: .constant(BarcodeData(value:"TRASHURE-BARCODE-SIMULATOR", type: .qr))
                ){
                    barcodeFound(code: $0.value)
                }
                onDraw: {
                    let lineWidth = 2
                    let lineColor = UIColor.red
                    let fillColor = UIColor(red: 0, green: 1, blue: 0.2, alpha: 0.4)
                    $0.draw(lineWidth: CGFloat(lineWidth), lineColor: lineColor, fillColor: fillColor)
                }
                
                VStack {
                    HStack {
                        Spacer()
                        HStack {
                            Button(action: {
                                //
                            }, label: {
                                ZStack {
                                    Circle()
                                    Image("icon-gallery")
                                        .imageScale(.large)
                                }.foregroundColor(Color.white)
                            })
                        }
                        .frame(width: 40, height: 40)
                        
                        HStack {
                            Button(action: {
                                flashlightOn.toggle()
                            }, label: {
                                ZStack {
                                    Circle()
                                    
                                    Image(flashlightOn ? "icon-flash-on" : "icon-flash-off")
                                        .imageScale(.large)
                                        .foregroundColor(flashlightOn ? Color.yellow : Color.blue)
                                }.foregroundColor(Color.white)
                            })
                            
                        }.frame(width: 40, height: 40)
                        
                    }.padding(.top, geometry.safeAreaInsets.top)
                    .padding([.leading, .trailing], 16)
                    
                    Spacer()
                }
                .sheet(isPresented: $showSheet) {
                    if activeSheet == .scanned {
                        ScanResultView(showSheet: $showSheet)
                    } else {
                        TrashbagView(showSheet: $showSheet)
                    }
                }
            }
        }.edgesIgnoringSafeArea(.all)
    }
    
    func barcodeFound(code: String) {
        if trashbagController.trashbagId == "" {
            activeSheet = .scanned
            trashbagController.trashbagId = code
        } else {
            activeSheet = .alreadyScanned
        }
        
        showSheet.toggle()
    }
}

struct ScannerView_Previews: PreviewProvider {
    static var previews: some View {
        ScannerView()
    }
}
