//
//  ToolBarTest.swift
//  SwiftuiBook
//
//  Created by Michail Malashkevich on 16.11.24.
//

import SwiftUI

struct ToolBarTest: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {

            }.navigationTitle("ToolBar")
                .font(.title)
                .toolbar {
                    ToolbarItem(placement: .automatic) {
                        Button(action: {}) {
                            Image(systemName: "arrow.2.circlepath.circle")
                        }
                    }
                    
                    ToolbarItem(placement: .bottomBar) {
                        Button(action: {}) {
                            Image(systemName: "arrow.2.circlepath.circle")
                            Text("Now here :)")
                        }
                    }
                    
                    // Group for grouped view :)
                    ToolbarItemGroup(placement: .topBarLeading) {
                        Button(action: {}) {
                            Image(systemName: "person.crop.circle")
                        }
                        
                        Button(action: {}) {
                            Image(systemName: "person.crop.circle")
                        }
                    }
                    
                    ToolbarItem(placement: .principal) {
                        Button(action: {}) {
                            Text("principle one")
                        }
                    }
                    
                    // MARK: Can pose to keyboard, and within ToolbarItemGroup it would be centered
                    ToolbarItemGroup(placement: .keyboard) {
                        
                    }
                    
                }
                .tint(.cyan)
        }

    }
}

#Preview {
    ToolBarTest()
}
