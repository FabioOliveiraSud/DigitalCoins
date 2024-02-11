//
//  Date.swift
//  SwiftCoin
//
//  Created by Fabio Avila Oliveira on 24/01/24.
//

import Foundation

extension Date {
    
    // 2024-01-21T01:26:22.047Z
    
    init(coinGeckoString: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = formatter.date(from: coinGeckoString) ?? Date()
        self.init(timeInterval: 0, since: date)
    }
    
    private var shortDateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd"
        return formatter
    }
    
    func asShortString() -> String {
        return shortDateFormatter.string(from: self)
    }
}
