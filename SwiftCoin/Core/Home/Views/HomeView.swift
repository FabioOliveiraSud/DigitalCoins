//
//  HomeView.swift
//  SwiftCoin
//
//  Created by Fabio Avila Oliveira on 30/11/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView(.vertical, showsIndicators: false) {
                    
                    // Top movers view
                    TopMoversView(viewModel: viewModel)
                    
                    Divider()
                    
                    // All coins view
                    AllCoinsView(viewModel: viewModel)
                }
                
                if viewModel.isLoadingData {
                    CustomLoadingIndicator()
                }
                
            }
            .navigationTitle("Live Prices")
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
