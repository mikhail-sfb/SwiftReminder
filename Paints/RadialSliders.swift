//
//  RadialSliders.swift
//  SwiftuiBook
//
//  Created by Michail Malashkevich on 15.11.24.
//

import SwiftUI

struct RadialSliders: View {
    private let gradient = Gradient(colors: [.pink, .cyan])
    @State var startRadius: Double = 5
    @State var endRadius: Double = 100

    
    var body: some View {
        ZStack {
            RadialGradient(gradient: gradient, center: .center, startRadius: startRadius, endRadius: endRadius)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                VStack {
                    Spacer()
                    
                    Text("Current startRadius is: ").foregroundStyle(.white) + Text(String(startRadius)).foregroundStyle(.orange)
                    
                    Slider(value: $startRadius, in: 1...150, step: 0.5)
                        .padding(.horizontal)
                    
                    
                    Text("Current $endRadius is: ").foregroundStyle(.white)  + Text(String(endRadius)).foregroundStyle(.orange)
                    Slider(value: $endRadius, in: 100...300, step: 0.5)
                        .padding([.horizontal, .bottom])
                }
                .background(Color.black, in: RoundedRectangle(cornerRadius: 20))
                .frame(height: 200)
                .padding()
            }
            
          
            
        }
    }
}

#Preview {
    RadialSliders()
}
