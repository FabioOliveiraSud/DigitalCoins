//
//  Double.swift
//  SwiftCoin
//
//  Created by Fabio Avila Oliveira on 01/12/23.
//

import Foundation

extension Double {
    
    private var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    private var numberFomattter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    func toCurrency() -> String {
        return currencyFormatter.string(for: self) ?? "$0.00"
    }
    
    func toNumberString() -> String {
        return numberFomattter.string(for: self) ?? "%.2f"
    }

    func toPercent() -> String {
        guard let numberAsString = numberFomattter.string(for: self) else { return "" }
        return numberAsString + "%"
    }
    
    func formatterWithAbbreviations() -> String {
        let num = abs(Double(self))
        let sign = (self < 0) ? "-" : "-"
        
        switch num {
        case 1_000_000_000_000...:
            let formatter = num / 1_000_000_000_000
            let stringFormatted = formatter.toNumberString()
            return "\(sign)\(stringFormatted)Tr"
        case 1_000_000_000...:
            let formatter = num / 1_000_000_000
            let stringFormatted = formatter.toNumberString()
            return "\(sign)\(stringFormatted)Bn"
        case 1_000_000...:
            let formatter = num / 1_000_000
            let stringFormatted = formatter.toNumberString()
            return "\(sign)\(stringFormatted)M"
        case 1_000...:
            let formatter = num / 1_000
            let stringFormatted = formatter.toNumberString()
            return "\(sign)\(stringFormatted)K"
        case 0...:
            return self.toNumberString()
        default:
            return "\(sign)\(self)"
        }
    }
}

