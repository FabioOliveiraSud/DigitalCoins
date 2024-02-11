//
//  ChartData.swift
//  SwiftCoin
//
//  Created by Fabio Avila Oliveira on 24/01/24.
//

import Foundation


struct ChartData: Identifiable {
    let id = UUID().uuidString
    let date: Date
    let value: Double
}
