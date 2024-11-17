//
//  ActionSheetTest.swift
//  SwiftuiBook
//
//  Created by Michail Malashkevich on 16.11.24.
//

import SwiftUI

// MARK: ActionSheet is deprecated and it would be better to use confirmationDialog
struct ConfirmationDialogTest: View {
    @State private var showConfDialog = false
    @State private var showConfDialogIpad = false

    var body: some View {
        VStack {
            Button("Show conf dialog") {
                showConfDialog.toggle()
            }
            
            // MARK: To not look like a dialog modi of confDialog need to be on a button
            Button("Show on ipad") {
                showConfDialogIpad.toggle()
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .confirmationDialog("Helloooooooooo from ipad?", isPresented: $showConfDialogIpad, titleVisibility: .visible) {
                Button("Cancel that", role: .cancel) {
                    
                }
                
                Button("Nothing") {
                    
                }
                
                Button("Delete", role: .destructive) {
                    
                }
            }
        }
        .padding()
        // No text by default, need to add title visability
        .confirmationDialog("Are you sure?", isPresented: $showConfDialog, titleVisibility: .visible) {
            Button("Cancel", role: .cancel) {
                
            }
            
            Button("Delete", role: .destructive) {
                
            }
        }
        
        // MARK: On ipads it would look a dialog
    }
}

#Preview {
    ConfirmationDialogTest()
}
