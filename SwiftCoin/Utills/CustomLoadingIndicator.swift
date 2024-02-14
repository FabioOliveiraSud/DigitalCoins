//
//  CustomLoadingIndicator.swift
//  SwiftCoin
//
//  Created by Fabio Avila Oliveira on 14/02/24.
//

import SwiftUI

struct CustomLoadingIndicator: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(.circular)
            .accentColor(.white)
            .scaleEffect(x: 1.5, y: 1.5, anchor: .center)
            .frame(width: 80, height: 80)
            .background(Color(.systemGray4))
            .cornerRadius(20)
    }
}

#Preview {
    CustomLoadingIndicator()
}
