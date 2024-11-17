//
//  SheetTest.swift
//  SwiftuiBook
//
//  Created by Michail Malashkevich on 16.11.24.
//

import SwiftUI

struct SheetTest: View {
    @State var presentSheet: Bool = false
    
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            
            Button("Present sheet") { presentSheet.toggle() }

        }
        .sheet(isPresented: $presentSheet) {
            FirstModal()
        }
        // also a thing to hide info about battery percentage and else
        .statusBarHidden()

    }
}

struct FirstModal: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Text("First modal")
            Button("Dismiss") { dismiss() }
        }
        .interactiveDismissDisabled() // prevent from swipe cancel
        // MARK: Detends (hold smth), order does not matter smaller goes first
        .presentationDetents([.medium, .large])
        .presentationDragIndicator(.hidden) // those up indicator for detends
        // .presentationDetents([.fraction(0.75), .height(200)]) - also variant of use :)
        .presentationBackground(.thinMaterial)
        .presentationCornerRadius(80)
    }
}

#Preview {
    SheetTest()
}
