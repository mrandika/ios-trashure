//
//  ChartModel.swift
//  Trashure
//
//  Created by Andika on 10/26/20.
//  Copyright © 2020 Muhammad Rizki Andika. All rights reserved.
//

import Foundation
import SwiftUI

let weeklyData: BarChart.DataSet = BarChart.DataSet(elements: [
BarChart.DataSet.DataElement(date: nil, xLabel: "Senin", bars: [BarChart.DataSet.DataElement.Bar(value: 5, color: Color.gray)]),

BarChart.DataSet.DataElement(date: nil, xLabel: "Selasa", bars: [BarChart.DataSet.DataElement.Bar(value: 7, color: Color.gray)]),

BarChart.DataSet.DataElement(date: nil, xLabel: "Rabu", bars: [BarChart.DataSet.DataElement.Bar(value: 2, color: Color.gray)]),

BarChart.DataSet.DataElement(date: nil, xLabel: "Kamis", bars: [BarChart.DataSet.DataElement.Bar(value: 9, color: Color.gray)]),

BarChart.DataSet.DataElement(date: nil, xLabel: "Jumat", bars: [BarChart.DataSet.DataElement.Bar(value: 12, color: Color.gray)]),

BarChart.DataSet.DataElement(date: nil, xLabel: "Sabtu", bars: [BarChart.DataSet.DataElement.Bar(value: 1, color: Color.gray)]),

BarChart.DataSet.DataElement(date: nil, xLabel: "Minggu", bars: [BarChart.DataSet.DataElement.Bar(value: 2, color: Color.gray)]),
], selectionColor: Color.green)

let monthlyData: BarChart.DataSet = BarChart.DataSet(elements: [
BarChart.DataSet.DataElement(date: nil, xLabel: "Jan", bars: [BarChart.DataSet.DataElement.Bar(value: 14, color: Color.gray)]),

BarChart.DataSet.DataElement(date: nil, xLabel: "Feb", bars: [BarChart.DataSet.DataElement.Bar(value: 20, color: Color.gray)]),

BarChart.DataSet.DataElement(date: nil, xLabel: "Mar", bars: [BarChart.DataSet.DataElement.Bar(value: 11, color: Color.gray)]),

BarChart.DataSet.DataElement(date: nil, xLabel: "Apr", bars: [BarChart.DataSet.DataElement.Bar(value: 7, color: Color.gray)]),

BarChart.DataSet.DataElement(date: nil, xLabel: "Mei", bars: [BarChart.DataSet.DataElement.Bar(value: 2, color: Color.gray)]),

BarChart.DataSet.DataElement(date: nil, xLabel: "Jun", bars: [BarChart.DataSet.DataElement.Bar(value: 12, color: Color.gray)]),

BarChart.DataSet.DataElement(date: nil, xLabel: "Jul", bars: [BarChart.DataSet.DataElement.Bar(value: 10, color: Color.gray)]),

BarChart.DataSet.DataElement(date: nil, xLabel: "Agu", bars: [BarChart.DataSet.DataElement.Bar(value: 32, color: Color.gray)]),

BarChart.DataSet.DataElement(date: nil, xLabel: "Sep", bars: [BarChart.DataSet.DataElement.Bar(value: 19, color: Color.gray)]),

BarChart.DataSet.DataElement(date: nil, xLabel: "Okt", bars: [BarChart.DataSet.DataElement.Bar(value: 22, color: Color.gray)]),

BarChart.DataSet.DataElement(date: nil, xLabel: "Nov", bars: [BarChart.DataSet.DataElement.Bar(value: 5, color: Color.gray)]),

BarChart.DataSet.DataElement(date: nil, xLabel: "Des", bars: [BarChart.DataSet.DataElement.Bar(value: 10, color: Color.gray)]),
], selectionColor: Color.green)

let yearlyData: BarChart.DataSet = BarChart.DataSet(elements: [
BarChart.DataSet.DataElement(date: nil, xLabel: "2017", bars: [BarChart.DataSet.DataElement.Bar(value: 89, color: Color.gray)]),

BarChart.DataSet.DataElement(date: nil, xLabel: "2018", bars: [BarChart.DataSet.DataElement.Bar(value: 129, color: Color.gray)]),

BarChart.DataSet.DataElement(date: nil, xLabel: "2019", bars: [BarChart.DataSet.DataElement.Bar(value: 151, color: Color.gray)]),

BarChart.DataSet.DataElement(date: nil, xLabel: "2020", bars: [BarChart.DataSet.DataElement.Bar(value: 164, color: Color.gray)]),
], selectionColor: Color.green)
