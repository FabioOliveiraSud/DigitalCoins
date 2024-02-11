//
//  StatisticModel.swift
//  SwiftCoin
//
//  Created by Fabio Avila Oliveira on 07/12/23.
//

import Foundation


struct StatisticModel: Identifiable {
    let id = UUID().uuidString
    let title: String
    let value: String
    let percentageChange: Double?
}
