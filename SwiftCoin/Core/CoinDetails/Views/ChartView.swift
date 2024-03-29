//
//  ChartView.swift
//  SwiftCoin
//
//  Created by Fabio Avila Oliveira on 24/01/24.
//

import SwiftUI
import Charts

struct ChartView: View {
    let viewModel: CoinDetailsViewModel
    var body: some View {
        Chart {
            ForEach (viewModel.chartData) { item in
                LineMark(x: .value("Date", item.date), y: .value("Price", item.value)
                )
                .interpolationMethod(.cardinal)
                .foregroundStyle(viewModel.chartLineColor)
            }
        }
        .chartXScale(domain: ClosedRange(uncheckedBounds: (lower: viewModel.startDate, upper: viewModel.endDate)))
        .chartXAxis {
            AxisMarks(position: .bottom, values: viewModel.xAxisValues) { value in
                AxisGridLine()
                AxisValueLabel() {
                    if let dateValue = value.as(Date.self) {
                       Text(dateValue.asShortString())
                    }
                }
            }
        }
        
        .chartYScale(domain: ClosedRange(uncheckedBounds: (lower: viewModel.minPrice, upper: viewModel.maxPrice)))
        .chartYAxis {
            AxisMarks(position: .leading, values: viewModel.yAxisValues) { value in
                AxisValueLabel() {
                    if let doubleValue = value.as(Double.self) {
                        Text(doubleValue.formatterWithAbbreviations())
                    }
                }
            }
        }
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View  {
        ChartView(viewModel: CoinDetailsViewModel(coin: dev.coin))
    }
}
