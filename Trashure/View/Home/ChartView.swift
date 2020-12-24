//
//  ChartView.swift
//  Trashure
//
//  Created by Andika on 10/26/20.
//  Copyright © 2020 Muhammad Rizki Andika. All rights reserved.
//

import SwiftUI

extension Binding {
    func onChange(_ handler: @escaping (Value) -> Void) -> Binding<Value> {
        return Binding(
            get: { self.wrappedValue },
            set: { selection in
                self.wrappedValue = selection
                handler(selection)
        })
    }
}

struct ChartView: View {
    @State private var rangeSelection = 0
    
    @State private var data = weeklyData
    @State private var label = "Minggu"
    @State private var value = 0
    
    @State private var weeklySelectedElement: BarChart.DataSet.DataElement? = weeklyData.elements.last
    @State private var monthlySelectedElement: BarChart.DataSet.DataElement? = monthlyData.elements.last
    @State private var yearlySelectedElement: BarChart.DataSet.DataElement? = yearlyData.elements.last
    
    var average = [5.4, 13.6, 133.2]
    var date = ["19-24 Oktober 2020", "Januari - Desember 2020", "2017 - 2020"]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Picker("Pilih Range Data", selection: $rangeSelection.onChange(pickerChange)) {
                    Text("Mingguan").tag(0)
                    Text("Bulanan").tag(1)
                    Text("Tahunan").tag(2)
                }.pickerStyle(SegmentedPickerStyle())
                
                Text("RATA-RATA")
                    .font(.footnote)
                    .fontWeight(.medium)
                    .foregroundColor(Color.gray)
                
                HStack(alignment: .firstTextBaseline, spacing: 4) {
                    Text(String(average[self.rangeSelection]))
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.semibold)
                    Text("Kg")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    Spacer()
                }.padding(.vertical, 4)
                
                Text(date[self.rangeSelection])
                    .font(.footnote)
                    .fontWeight(.medium)
                    .foregroundColor(Color.gray)
                
                Divider()
                
                Group {
                    if rangeSelection == 0 {
                        BarChart(dataSet: weeklyData, selectedElement: $weeklySelectedElement)
                    } else if rangeSelection == 1 {
                        BarChart(dataSet: monthlyData, selectedElement: $monthlySelectedElement)
                    } else if rangeSelection == 2 {
                        BarChart(dataSet: yearlyData, selectedElement: $yearlySelectedElement)
                    }
                }.padding(.top, 16.0)
                .frame(height: 256.0)
                
                Divider()
                
                VStack(alignment: .leading) {
                    if rangeSelection == 0 {
                        DetailCard(title: "Hari", selectedElement: weeklySelectedElement!)
                    } else if rangeSelection == 1 {
                        DetailCard(title: "Bulan", selectedElement: monthlySelectedElement!)
                    } else if rangeSelection == 2 {
                        DetailCard(title: "Tahun", selectedElement: yearlySelectedElement!)
                    }
                }
                .padding()
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(12)
                
                InfoCard(value: "Dengan mendaur ulang sampah, kamu berkontribusi terhadap kelestarian lingkungan loh! Selain itu, dengan mendaur ulang kertas, kamu juga sudah berkontribusi mengurangi jumlah pohon yang harus ditebang!")
            }.padding()
        }.navigationBarTitle("Sampah Terkumpul", displayMode: .inline)
    }
    
    private func pickerChange(_ tag: Int) {
        if rangeSelection == 0 {
            self.label = self.weeklySelectedElement?.xLabel ?? "Minggu"
            self.value = Int(self.weeklySelectedElement?.bars[0].value ?? 0)
        } else if rangeSelection == 1 {
            self.label = self.monthlySelectedElement?.xLabel ?? "Des"
            self.value = Int(self.monthlySelectedElement?.bars[0].value ?? 0)
        } else if rangeSelection == 2 {
            self.label = self.yearlySelectedElement?.xLabel ?? "2020"
            self.value = Int(self.yearlySelectedElement?.bars[0].value ?? 0)
        }
    }
}

struct DetailCard: View {
    var title: String
    var selectedElement: BarChart.DataSet.DataElement
    
    var body: some View {
        return HStack(spacing: 6) {
            Text("\(title): \(selectedElement.xLabel)")
                .font(.headline)
            
            Spacer()
            
            Text("\(Int(selectedElement.bars[0].value)) Kg")
                .font(.callout)
                .foregroundColor(.secondary)
        }
    }
}

struct InfoCard: View {
    var value: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 6) {
                Group {
                    Image(systemName: "info.circle")
                    Text("Tahukah Kamu?")
                        .font(.body)
                        .fontWeight(.medium)
                }
                
                Spacer()
            }
            
            Divider()
            
            HStack(alignment: .firstTextBaseline, spacing: 4) {
                Text(value)
                    .font(.system(size: 14))
                Spacer()
            }
        }
        .padding()
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(12)
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
    }
}
