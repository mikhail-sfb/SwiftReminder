//
//  RatotationEffectTest.swift
//  SwiftuiBook
//
//  Created by Michail Malashkevich on 16.11.24.
//

import SwiftUI

// how you see frame does not rotate, only content
struct RotatationEffectTest: View {
    @State var rotationAngle: Double = 0
    @State var rotationAngle3D: Double = 0

    var body: some View {
        VStack(spacing: 0) {
            // can set the anchor
            Image("Grad")
                .rotationEffect(.degrees(rotationAngle), anchor: .top)
                .border(Color.red, width: 1)
                .padding(.bottom)

            Text("2D dimension rotation slider")
            Slider(value: $rotationAngle, in: 0...360, step: 1)

            // MARK: 3D rotations
            Image("Grad")
                .rotation3DEffect(
                    .degrees(rotationAngle3D), axis: (x: 1, y: 0, z: 0),
                    anchor: .trailing
                )
                .border(Color.red, width: 1)
                .padding(.bottom)

            Text("3D dimension rotation slider")
            Slider(value: $rotationAngle3D, in: 0...360, step: 1)
        }
        .padding()
    }
}

struct ScaleEffectTest: View {
    var body: some View {
        ScrollView {
            Image("Grad")
                .scaleEffect(1.2, anchor: .bottom)
                .border(.red, width: 2)
                .padding(.bottom, 80)
            
            Image("Grad")
                .scaleEffect(x: 0.5, y: 1.6)
                .border(.red, width: 2)
                .padding(.bottom, 60)

            
            // MARK: Flip without rotation
            // Shadow btw is black with 33% of opacity
            Image("Grad")
                // shadow also can be inner one: myShadow = ShadowStyle.inner(...)
                .shadow(color: .red ,radius: 1, x: -30, y: -20)
                .scaleEffect(x: -1, y: -1)
                .border(.red, width: 2)
                .padding(.bottom, 30)

        }
        .scrollIndicators(.hidden)
        
    }
}

#Preview {
    ScaleEffectTest()
}

#Preview {
    RotatationEffectTest()
}
