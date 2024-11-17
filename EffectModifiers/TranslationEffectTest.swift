//
//  TranslationEffectTest.swift
//  SwiftuiBook
//
//  Created by Michail Malashkevich on 16.11.24.
//

import SwiftUI

// MARK: Useless stuff as i think, can not even change anchor
struct TranslationEffectTest: View {
    @State var move: Bool = false
    
    var body: some View {
        VStack {
            Image(systemName: "arrow.2.circlepath.circle")
                .font(.largeTitle)
                .transformEffect(move ? CGAffineTransform(translationX: 10, y: -20) : .identity)
                .transformEffect(move ? CGAffineTransform(rotationAngle: CGFloat(Angle(degrees: 45).radians)) : .identity)
            
            Spacer()
            
            HStack {
                Spacer()
                
                Button("Move") {
                    withAnimation {
                        move.toggle()
                    }
                }
                
                Spacer()
            }
        }
        .padding()
    }
}

#Preview {
    TranslationEffectTest()
}
