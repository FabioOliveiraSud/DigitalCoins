//
//  LazyNavigationView.swift
//  SwiftCoin
//
//  Created by Fabio Avila Oliveira on 14/02/24.
//

import SwiftUI

struct LazyNavigationView<Content: View> : View {
    let build: () -> Content
    
    init (_ build: @autoclosure @escaping() -> Content) {
        self.build = build
    }
    
    var body: Content {
        build()
    }
}
