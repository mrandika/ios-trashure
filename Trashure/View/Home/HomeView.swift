//
//  HomeView.swift
//  Trashure
//
//  Created by Andika on 11/22/20.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var debugController = DebugController()
    @ObservedObject var trashbagController = TrashbagController()
    @State var showNotificationSheet: Bool = false
    @Environment(\.presentationMode) var presentationMode
    
    let setoran = [false, true, true]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    Group {
                        Text(LocalizedStringKey("Highlights"))
                            .font(.headline)
                            .fontWeight(.bold)
                        
                        CardComponent(image: "creditcard.fill", status: getTime(), title: LocalizedStringKey("Balance"), value: formatRupiah(value: Int(debugController.balance) ?? 0), subtitle: "rupiah", showTime: true, showChevron: false)
                        CardComponent(image: "person.fill", status: getTime(), title: LocalizedStringKey("Level"), value: debugController.level, subtitle: "", showTime: false, showChevron: false)
                        
                        NavigationLink(destination: TrashbagListView()) {
                            CardComponent(image: "link", status: getTime(), title: LocalizedStringKey("Trashbag"), value: self.trashbagController.trashbagId != "" ? "1" : "0", subtitle: LocalizedStringKey("Connected"), showTime: false, showChevron: true)
                        }.buttonStyle(PlainButtonStyle())

                        NavigationLink(destination: ChartView()) {
                            VStack(alignment: .leading) {
                                HStack {
                                    Text(LocalizedStringKey("Show Collection Charts"))
                                        .font(.system(size: 14))
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                    .font(.callout)
                                    .foregroundColor(.secondary)
                                }.padding()
                            }
                            .background(Color(UIColor.secondarySystemBackground))
                            .cornerRadius(12)
                        }
                        
                    }
                    
                    Group {
                        HStack {
                            Text(LocalizedStringKey("Recent Collection"))
                                .font(.headline)
                                .fontWeight(.bold)
                                .padding(.top, 32)
                            
                            Spacer()
                            
                            if debugController.depositAvailable {
                                NavigationLink(destination: DepositView()) {
                                    Text(LocalizedStringKey("See All"))
                                        .font(.system(size: 16))
                                        .padding(.top, 32)
                                }
                            }
                        }
                        
                        if debugController.depositAvailable {
                            ForEach(0 ..< setoran.count) { status in
                                DepositRow(completed: self.setoran[status])
                            }
                        } else {
                            Text(LocalizedStringKey("No Recent Collection"))
                                .foregroundColor(Color(UIColor.systemGray))
                        }
                    }
                    
                    Group {
                        Text(LocalizedStringKey("Tips"))
                            .font(.headline)
                            .fontWeight(.bold)
                            .padding(.top, 32)
                        ScrollView (.horizontal, showsIndicators: false) {
                             HStack {
                                ForEach(tipsItem) { tip in
                                    TipsRow(dataItem: tip)
                                        .frame(width: 250, height: 200)
                                }
                             }
                        }
                    }
                }.padding()
            }
            .navigationBarTitle(LocalizedStringKey("Home"))
            .navigationBarItems(trailing: Button(action: {
                showNotificationSheet.toggle()
            }) {
                Image(self.debugController.notificationAvailable ? "bell.badge" : "bell")
                    .imageScale(.large)
            }.sheet(isPresented: $showNotificationSheet) {
                NavigationView {
                    NotificationView(showNotificationSheet: $showNotificationSheet)
                }
            })
        }
    }
    private func getTime() -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        return dateFormatter.string(from: date)
    }
    
    private func formatRupiah(value: Int) -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "id_ID")
        formatter.groupingSeparator = "."
        formatter.numberStyle = .decimal
        
        let formattedAmount = formatter.string(from: value as NSNumber)
        return formattedAmount ?? "0"
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
