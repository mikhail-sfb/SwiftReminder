//
//  CustomPopupsTest.swift
//  SwiftuiBook
//
//  Created by Michail Malashkevich on 16.11.24.
//

import SwiftUI

struct CustomPopupsTest: View {
    @State var showingModal = false
    
    var body: some View {
        ZStack {
            VStack {
                Button("Show popup") {
                    showingModal.toggle()
                }
            }
            
            if $showingModal.wrappedValue {
                ZStack {
                    Color.black.opacity(0.5)
                        .ignoresSafeArea()
                        .onTapGesture {
                            showingModal = false
                        }
                    
                    VStack(spacing: 20) {
                        Text("Popup")
                            .bold()
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.orange)
                            .foregroundStyle(.white)
                        
                        Spacer()
                        
                        Button("Close") {
                            showingModal = false
                        }
                        .padding()
                    }
                    .frame(width: 300, height: 200)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .shadow(radius: 20)
                    
                }
            }
        }
    }
}

#Preview {
    CustomPopupsTest()
}
