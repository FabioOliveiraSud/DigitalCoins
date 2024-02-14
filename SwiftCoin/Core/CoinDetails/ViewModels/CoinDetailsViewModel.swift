//
//  CoinDetailsViewModel.swift
//  SwiftCoin
//
//  Created by Fabio Avila Oliveira on 20/01/24.
//

import SwiftUI

class CoinDetailsViewModel {
    private let coin: Coin
    
    
    var chartData = [ChartData]()
    var startDate = Date()
    var endDate = Date()
    var maxPrice = 0.0
    var minPrice = 0.0
    var xAxisValues = [Date]()
    var yAxisValues = [Double]()
    
    var coinName: String {
        return coin.name
    }
    
    var chartLineColor: Color {
        let priceChange = (coin.sparklineIn7D?.price.last ?? 0) - (coin.sparklineIn7D?.price.first ?? 0)
        return priceChange > 0 ? .green : .red
    }
    
    var overviewSectionModel: CoinDetailSectionModel {
        
        let price = coin.currentPrice.toCurrency()
        let pricePercenteChange = coin.priceChangePercentage24H
        let priceStats = StatisticModel(title: "Current Price", value: price, percentageChange: pricePercenteChange)
        
        let marketCap = coin.marketCap ?? 0
        let marketCapPercedntChange = coin.marketCapChangePercentage24H
        let marketCapStat = StatisticModel(title: "Market Capitalization", value: marketCap.formatterWithAbbreviations(), percentageChange: marketCapPercedntChange)
        
        let rank = coin.marketCapRank
        let rankStat = StatisticModel(title: "Rank", value: "\(rank)", percentageChange: nil)
        
        let volume = coin.totalVolume ?? 0
        let volumeStat = StatisticModel(title: "Volume", value: volume.formatterWithAbbreviations(), percentageChange: nil)

        return CoinDetailSectionModel(title: "Overview", stats: [priceStats, marketCapStat, rankStat, volumeStat])
        
    }
    
    var additionalDetailsModel: CoinDetailSectionModel {
        
        let high = coin.high24H?.toCurrency() ?? "n/a"
        let highStat = StatisticModel(title: "24H High", value: high, percentageChange: nil)
        
        let low = coin.low24H?.toCurrency() ?? "n/a"
        let lowStat = StatisticModel(title: "24H Low", value: low, percentageChange: nil)
        
        let priceChange24H = coin.priceChange24H.toCurrency()
        let percentChange24H = coin.priceChangePercentage24H
        let priceChangeStat = StatisticModel(title: "24H Price Change", value: priceChange24H, percentageChange: percentChange24H)
        
        let marketCapChange = coin.marketCapChange24H ?? 0
        let marketCapChangePercent = coin.marketCapChangePercentage24H
        let marketStat = StatisticModel(title: "24H Market Cap Change", value: "$\(marketCapChange.formatterWithAbbreviations())", percentageChange: marketCapChangePercent)
        
        return CoinDetailSectionModel(title: "Additional details", stats: [highStat, lowStat, priceChangeStat, marketStat])
        
    }
    
    init(coin: Coin) {
        self.coin = coin
        cofigureChartData()
        
        print("DEBUG: Coin is \(self.coinName)")
    }
    
    func cofigureChartData() {
        guard let priceData = coin.sparklineIn7D?.price else { return }
        var index = 0
        self.minPrice = priceData.min()!
        self.maxPrice = priceData.max()!
        self.endDate = Date(coinGeckoString: coin.lastUpdated ?? "")
        self.startDate = endDate.addingTimeInterval(-7 * 60 * 60 * 24)
        self.yAxisValues = [minPrice, (minPrice + maxPrice / 2) ,maxPrice]
        self.xAxisValues = [startDate, endDate]
        
        for price in priceData.reversed() {
            let date = endDate.addingTimeInterval(-1 * 60 * 60 * Double(index))
            
            let chartDateItem = ChartData(date: date, value: price)
            self.chartData.append(chartDateItem)
            index += 1
        }
    }
}
