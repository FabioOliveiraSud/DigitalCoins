//
//  CoinDetailsView.swift
//  SwiftCoin
//
//  Created by Fabio Avila Oliveira on 07/12/23.
//

import SwiftUI

struct CoinDetailsView: View {
    let viewModel: CoinDetailsViewModel
    
    init(coin: Coin) {
        self.viewModel = CoinDetailsViewModel(coin: coin)    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                // Chart
                ChartView(viewModel: viewModel)
                    .frame(height: 250)
                    .padding(.vertical)
                
                // Overview
                CoinDetailsSection(model: viewModel.overviewSectionModel)
                    .padding(.vertical)
                
                // Additional details
                CoinDetailsSection(model: viewModel.additionalDetailsModel)
                    .padding(.vertical)
            }
            .padding()
            .navigationTitle("Bitcoin")
        }
    }
}

struct CoinDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CoinDetailsView(coin: dev.coin)
    }
}
