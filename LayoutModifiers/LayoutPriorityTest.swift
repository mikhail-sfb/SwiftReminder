//
//  LayoutPriorityTest.swift
//  SwiftuiBook
//
//  Created by Michail Malashkevich on 16.11.24.
//

import SwiftUI

struct LayoutPriorityTest: View {
    var body: some View {
        // MARK: Main concept, that we pose children, but in bigger system we also could spec the parent
        
        VStack {
            VStack {
                Text("hello")
                Text("hello")
                    .layoutPriority(3)
                Text("hello")
            }
            .layoutPriority(5)
            
            VStack {
                Text("hello")
            }
            .layoutPriority(1)
        }
    }
}

#Preview {
    LayoutPriorityTest()
}
