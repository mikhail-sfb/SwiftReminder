//
//  AspectRatioTest.swift
//  SwiftuiBook
//
//  Created by Michail Malashkevich on 16.11.24.
//

import SwiftUI

struct AspectRatioTest: View {
    // MARK: Aspect ration is like width to height
    var body: some View {
        VStack {
            Image("Grad")
                .resizable()
                .aspectRatio(0.5, contentMode: .fit)
                .frame(height: 460)
            
            Image("Grad")
                .resizable()
                .aspectRatio(2, contentMode: .fit)
                .frame(height: 260)

        }
    }
}

#Preview {
    AspectRatioTest()
}
