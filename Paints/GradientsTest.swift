//
//  GradientsTest.swift
//  SwiftuiBook
//
//  Created by Michail Malashkevich on 15.11.24.
//

import SwiftUI

struct GradientsTest: View {
    private let gradient = Gradient(colors: [.red, .blue])
    // MARK: Image paint, conforms to shapeStyle
    let img = ImagePaint(image: Image("Grad"), scale: 1) // created with 50% scale of original img
    // MARK: when colors stop (location is like 0--1 downstairs)
    let gradientColors = Gradient(stops: [.init(color: .red, location: 0), .init(color: .blue, location: 1)])
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            Circle()
                .strokeBorder(img, lineWidth: 20, antialiased: true)
                .frame(width: 180, height: 180)
                .padding(.bottom)
            
            Image("Grad")
                .mask(Circle().stroke(lineWidth: 20).padding())
            
            Text("Hello World")
                .frame(width: 300, height: 300)
                .border(ImagePaint(image: Image("Grad"), sourceRect: CGRect(x: 0, y: 0.25, width: 1, height: 0.5), scale: 0.1), width: 30)
            
            
            // MARK: Angular gradient
            RoundedRectangle(cornerRadius: 50)
                .fill(AngularGradient(gradient: gradient, center: .center))
                .frame(width: 250, height: 100)
            
            RoundedRectangle(cornerRadius: 50)
                .fill(AngularGradient(gradient: gradient, center: .bottomTrailing, angle: .degrees(0)))
                .frame(width: 250, height: 100)
            
            // MARK: Conic gradient (the same as prev but can be used any modi)
            RoundedRectangle(cornerRadius: 50)
                .foregroundStyle(.conicGradient(gradient, center: .center, angle: .degrees(90)))
                .frame(width: 250, height: 100)
            
            // MARK: Eliptical and radial (eliptical conforms to the size of its container)
            RoundedRectangle(cornerRadius: 50)
                .foregroundStyle(.ellipticalGradient(gradient, center: .center))
                .frame(width: 250, height: 100)
            
            HStack {
                RoundedRectangle(cornerRadius: 50)
                    .foregroundStyle(.ellipticalGradient(gradient, center: .center, startRadiusFraction: 0,endRadiusFraction: 0.9)) // MARK: color spread
                    .frame(width: 100 ,height: 300)
                
                RoundedRectangle(cornerRadius: 50)
                    .foregroundStyle(.radialGradient(gradient, center: .center, startRadius: 100, endRadius: 20))
                    .frame(width: 100 ,height: 300)
            }
            
            RoundedRectangle(cornerRadius: 50)
                .foregroundStyle(.radialGradient(gradient, center: .center, startRadius: 100, endRadius: 20))
                .frame(width: 250, height: 100)
            
            // MARK: Linear finaly :)
            RoundedRectangle(cornerRadius: 50)
                .foregroundStyle(.linearGradient(gradient, startPoint: .top, endPoint: .bottom))
                .frame(width: 250, height: 100)
            
            // With custom directions
            RoundedRectangle(cornerRadius: 50)
                .foregroundStyle(.linearGradient(gradient, startPoint: UnitPoint(x: 0.1, y: 0.4) , endPoint: .bottomTrailing))
                .frame(width: 250, height: 100) // --   0---1
                                                // --   1
            RoundedRectangle(cornerRadius: 50)
                .foregroundStyle(.red)
                .blur(radius: 10)
                .frame(width: 250, height: 100)
            
            Image("Radiuses")
            
            // MARK: About radial
            RadialGradient(gradient: gradient, center: .center, startRadius: 100, endRadius: 20)
                .frame(width: 200, height: 200)
        }
        .padding()
    }
}

#Preview {
    GradientsTest()
}
