//
//  PopoverTest.swift
//  SwiftuiBook
//
//  Created by Michail Malashkevich on 16.11.24.
//

import SwiftUI

// MARK: Like a combination between a Sheet and ContextMenu
struct PopoverTest: View {
    @State var showPopover: Bool = false
    
    var body: some View {
        VStack {
            Button {
                showPopover.toggle()
            } label: {
                Text("Trigger Popover")
            }
            .popover(isPresented: $showPopover, arrowEdge: .top) {
                VStack {
                    Text("Popover")
                        .font(.largeTitle)
                    Text("Content")
                }
            }
        }
    }
}

#Preview {
    PopoverTest()
}
