//
//  ContextMenuTest.swift
//  SwiftuiBook
//
//  Created by Michail Malashkevich on 16.11.24.
//

import SwiftUI

struct ContextMenuTest: View {
    // MARK: Great idea to make a var with data for context menu and manipulate with it
    // . contextMenu(image == nil ? nil : actions)
    
    var body: some View {
        VStack {
            Image("Grad")
                .resizable()
                .frame(width: 400, height: 200)
                .aspectRatio(contentMode: .fit)
                .mask {
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 400, height: 200)
                }
                .contextMenu {
                    // The order does not matter
                    Button(action: {}) {
                        Text("Action")
                        Image(systemName: "arrow.2.circlepath.circle")
                    }
                    
                    Button(action: {}) {
                        Image(systemName: "arrow.2.circlepath.circle")
                        Text("Action")
                    }
                }
                
        }
        .padding()
    }
}

#Preview {
    ContextMenuTest()
}
