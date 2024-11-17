//
//  FullScreenCoverTest.swift
//  SwiftuiBook
//
//  Created by Michail Malashkevich on 16.11.24.
//

import SwiftUI

struct FullScreenCoverTest: View {
    // nothing new
    @State var showFullScreenCover: Bool = false
    
    var body: some View {
        Button("Show screen") {
            showFullScreenCover.toggle()
        }
        .fullScreenCover(isPresented: $showFullScreenCover) {
            RoundedRectangle(cornerRadius: 50)
                .fill(.orange)
                .hidden()
                .overlay {
                    Text("It is hidden but occupies the space")
                }
            // to go back need dismiss
        }
    }
}

#Preview {
    FullScreenCoverTest()
}
