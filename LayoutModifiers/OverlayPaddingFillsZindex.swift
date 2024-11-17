//
//  OverlayPaddingFillsZindex.swift
//  SwiftuiBook
//
//  Created by Michail Malashkevich on 16.11.24.
//

import SwiftUI

struct OverlayPaddingFillsZindex: View {
    var body: some View {
        // nothing really out of core, zIndex quite cool i think, can pose elements behind
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .position(x: 60, y: 130)
    }
}

#Preview {
    OverlayPaddingFillsZindex()
}
