//
//  TopMoversItemView.swift
//  SwiftCoin
//
//  Created by Fabio Avila Oliveira on 30/11/23.
//

import SwiftUI
import Kingfisher

struct TopMoversItemView: View {
    let coin: Coin
    
    var body: some View {
        VStack(alignment: .leading) {
            // Image
            KFImage(URL(string: coin.image))
                .resizable()
                .frame(width: 32, height: 32)
                .foregroundColor(.orange)
                .padding(.bottom, 8)
            
            // Coin info
            HStack(spacing: 2) {
                Text(coin.symbol.uppercased())
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(Color.theme.primaryTextColor)
                    
                Text(coin.currentPrice.toCurrency()   )
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            // Coin percent change
            Text(coin.priceChangePercentage24H.toPercent())
                .font(.title2)
                .foregroundColor(coin.priceChangePercentage24H > 0 ? .green : .red)
        }
        .frame(width: 140, height: 140)
        .background(Color.theme.itemBackgroundColor)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.systemGray), lineWidth: 2)
        )
    }
}

//struct TopMoversItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        TopMoversItemView()
//    }
//}

