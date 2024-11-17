//
//  ViewModifierTest.swift
//  SwiftuiBook
//
//  Created by Michail Malashkevich on 16.11.24.
//

import SwiftUI

struct ViewModifierTest: View {
    var body: some View {
        Text("Hello, World! 1")
            .modifier(TextBanner())
        
        Text("Hello, World! 2")
            .makeTextBanner()

        RoundedRectangle(cornerRadius: 25)
            .addOutline(lineWidth: 15)
            .frame(width: 300, height: 100)
        
        RoundedRectangle(cornerRadius: 25)
            .addOutline(lineWidth: 15, trim: 0.8)
            .frame(width: 300, height: 100)
        
        Image("Grad")
            .resizable()
            .interpolation(.none)
            .renderingMode(.template)

        Image("Grad")
            .resizable()
            .interpolation(.high)
    }
}

// 1
struct TextBanner: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .font(.title)
            .padding()
            .background(Color.red)
            .foregroundStyle(.white)
    }
}

// 2
extension View {
    func makeTextBanner() -> some View {
        self
            .frame(maxWidth: .infinity)
            .font(.title)
            .padding()
            .background(Color.red)
            .foregroundStyle(.white)
    }
}

// MARK: Those were working fire with views, but...shapes?
extension Shape {
    func addOutline(lineWidth: CGFloat = 1, trim: CGFloat = 1) -> some View {
        let pinkPurpleGradient = Gradient(colors: [.pink, .purple])
        let linearGradient = LinearGradient(gradient: pinkPurpleGradient, startPoint: .topLeading, endPoint: .bottomTrailing)
        
        return self
            .trim(from: 0, to: trim)
            .stroke(linearGradient, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
            .padding(lineWidth/2 + 5)
    }
}

#Preview {
    ViewModifierTest()
}
