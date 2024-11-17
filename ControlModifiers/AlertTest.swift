//
//  AlertTest.swift
//  SwiftuiBook
//
//  Created by Michail Malashkevich on 16.11.24.
//

import SwiftUI

struct AlertTest: View {
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            Button("Show alert :)") {
                showAlert.toggle()
            }
        }
        .padding()
        .alert("Alert" , isPresented: $showAlert) {
            Button(role: .destructive) {
                
            } label: {
                Text("Delete")
            }
            // MARK: Nevertheless we added just delete button we got cancel by default but swift gonna be swift so you can not reordered position of your buttons even if you would create your custom cancel
            
        } message: {
            Text("No modi works for me :(")
                .foregroundStyle(.red)
        }
    }
}

struct ResultData {
    let message: String
    let actions: String
}

struct UsingDataAlert: View {
    @State var didError = false
    @State var resultDetails: ResultData?
    
    var body: some View {
        VStack {
            Button("Start smth") {
                didError = true
                resultDetails = ResultData(message: "Error", actions: "Retry")
            }
        }
        .alert("Results", isPresented: $didError, presenting: resultDetails) { details in
            Button(details.actions) {
                
            }
            
            Button("Cancel", role: .cancel, action: {})
        } message: { details in
            Text("Details: \(details.message)")
        }
    }
}

#Preview {
    UsingDataAlert()
}


#Preview {
    AlertTest()
}
