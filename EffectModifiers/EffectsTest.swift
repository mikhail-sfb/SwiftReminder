//
//  EffectsTest.swift
//  SwiftuiBook
//
//  Created by Michail Malashkevich on 16.11.24.
//

import SwiftUI

struct EffectsTest: View {
    @State var likes = 0
    @State private var scaling = false

    var body: some View {
        ScrollView {
            // MARK: One of the most cool things
            Text("Masks are great!")
            HStack {
                Image("Grad")
                    .resizable()
                    .mask(Text("Masked :)"))
                    .frame(width: 80, height: 80)
                
                Image("Grad")
                    .resizable()
                    .mask(Circle().opacity(0.5))
                    .frame(width: 80, height: 80)
            }
            
            HStack {
                Image("Grad")
                    .resizable()
                    .blur(radius: 6)
                    .frame(width: 40, height: 40)

                Image("Grad")
                    .resizable()
                    .colorInvert()
                    .frame(width: 40, height: 40)

                // MARK: Color multi returns  VIEW, not a color
                Image("Grad")
                    .resizable()
                    .colorMultiply(.cyan.opacity(0.9))
                    .frame(width: 40, height: 40)

                VStack {
                    Image("Grad")
                        .resizable()
                        .contrast(5)
                        .frame(width: 40, height: 40)

                    Image("Grad")
                        .resizable()
                        .contrast(-1)
                        .frame(width: 40, height: 40)
                }
                
                Image("Grad")
                    .resizable()
                    .hueRotation(.degrees(270))
                    .frame(width: 40, height: 40)
                
                // The darker the color the more transparent
                Image("Grad")
                    .resizable()
                    .luminanceToAlpha()
                    .frame(width: 40, height: 40)
                
                Image("Grad")
                    .resizable()
                    .saturation(5)
                    .frame(width: 40, height: 40)
            }

            ZStack {
                Color.yellow
                    .frame(width: 80, height: 80)

                Color.cyan
                    .frame(width: 80, height: 80)
                    .offset(x: 20, y: 20)
                    .blendMode(.multiply)
            }

            Color.blue
                .brightness(0.6)
                .frame(width: 80, height: 80)
                .zIndex(-1)

            Circle()
                .fill(.orange)
                .frame(width: 120, height: 120)
                .offset(x: 10, y: 10)
                .border(.red)
                .clipped()

            // MARK: Can also pass custom ones shapes
            HStack(spacing: 5) {
                Image("Grad")
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(.leading)

                Image("Grad")
                    .resizable()
                    .clipShape(Circle())
            }
            .scaledToFit()
            .frame(width: 400)
            .border(.red)

            Color.yellow
                .frame(width: 80, height: 80)
                .colorInvert()  // oposite color circle

            // MARK: Compositing viewS into a view
            HStack {
                TwoCircles()
                    .opacity(0.5)
                    .shadow(color: .red, radius: 3)

                TwoCircles()
                    .compositingGroup()
                    .opacity(0.5)
                    .shadow(color: .red, radius: 3)
            }

            // MARK: Content shape
            // works only when i tap on image/text
            HStack {
                VStack {
                    Image(systemName: "heart.fill")
                        .frame(width: 100, height: 100)
                    Text("Likes amount: \(likes)")
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 15).stroke(
                        .red, lineWidth: 1)
                )
                .onTapGesture {
                    likes = likes + 1
                }

                // MARK: spec content shape (Important / cool)
                VStack {
                    Image(systemName: "heart.fill")
                        .frame(width: 100, height: 100)
                    Text("Likes amount: \(likes)")
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 15).stroke(
                        .red, lineWidth: 1)
                )
                .contentShape(RoundedRectangle(cornerRadius: 15))
                .onTapGesture {
                    likes = likes + 1
                }

                // MARK: Spec for diff occasions
                Image(systemName: "trash.square")
                    .font(.system(size: 70))
                    .contentShape(
                        .contextMenuPreview, RoundedRectangle(cornerRadius: 10)
                    )
                    .contextMenu {
                        Button("menu 1") {

                        }
                    }
            }

            // MARK: Contrast - grayscale
            VStack {
                HStack {
                    Color.red
                        .contrast(-1)
                        .frame(width: 50, height: 50)
                    Color.red
                        .contrast(0.3)
                        .frame(width: 50, height: 50)
                    Color.red
                        .contrast(1)
                        .frame(width: 50, height: 50)
                    Color.red
                        .contrast(5)
                        .frame(width: 50, height: 50)
                }

                HStack {
                    Color.cyan
                        .contrast(-1)
                        .frame(width: 50, height: 50)
                    Color.cyan
                        .contrast(0.3)
                        .frame(width: 50, height: 50.0)
                    Color.cyan
                        .contrast(1)
                        .frame(width: 50, height: 50)
                    Color.cyan
                        .contrast(5)
                        .frame(width: 50, height: 50)
                }
                
                HStack {
                    Color.red
                        .grayscale(-1)
                        .frame(width: 50, height: 50)
                    Color.red
                        .grayscale(0.3)
                        .frame(width: 50, height: 50)
                    Color.red
                        .grayscale(1)
                        .frame(width: 50, height: 50)
                    Color.red
                        .grayscale(5)
                        .frame(width: 50, height: 50)
                }

                HStack {
                    Color.cyan
                        .grayscale(-1)
                        .frame(width: 50, height: 50)
                    Color.cyan
                        .grayscale(0.3)
                        .frame(width: 50, height: 50.0)
                    Color.cyan
                        .grayscale(1)
                        .frame(width: 50, height: 50)
                    Color.cyan
                        .grayscale(5)
                        .frame(width: 50, height: 50)
                }
                
                // MARK: Hue rotation
                HStack {
                    Color.cyan
                        .hueRotation(.degrees(90))
                        .frame(width: 50, height: 50)
                    Color.cyan
                        .hueRotation(.degrees(180))
                        .frame(width: 50, height: 50.0)
                    Color.cyan
                        .hueRotation(.degrees(270))
                        .frame(width: 50, height: 50)
                    Color.cyan
                        .hueRotation(.degrees(360))
                        .frame(width: 50, height: 50)
                    }
            }

            HStack {
                Text("Easy access to theme back color:")
                
                Circle()
                    .foregroundStyle(.background) // semantic color
                    .frame(width: 50, height: 50)
                    .padding()
                    .background {
                        Circle()
                            .fill(.blue)
                    }
                    .overlay {
                        Text("white ")

                    }
            }
            
            
            Button("Change Scale") {
                self.scaling = true
            }

            GeometryReader { gr in
                ZStack {
                    ForEach(0...200, id: \.self) { _ in
                        Circle()
                            .foregroundStyle(.orange)
                            .opacity(0.2)
                            .animation(
                                Animation.interpolatingSpring(
                                    stiffness: 0.5, damping: 0.5
                                )
                                .repeatForever()
                                .speed(.random(in: 0.05...0.9))
                                .delay(.random(in: 0...2))
                            )
                            .scaleEffect(
                                self.scaling ? .random(in: 0.1...2) : 1
                            )
                            .frame(
                                width: .random(in: 10...100),
                                height: .random(in: 10...100)
                            )
                            .position(
                                x: randomCoordinate(max: gr.size.width),
                                y: randomCoordinate(max: gr.size.height)
                            )
                    }
                }
                .drawingGroup()  // MARK: Improves rendering performance
            }
            .frame(width: .infinity, height: 400)

        }
        .padding()
    }

    func randomCoordinate(max: CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max)
    }

}

struct TwoCircles: View {
    var body: some View {
        HStack(spacing: -60) {
            Circle()
                .fill(.red)
            Circle()
                .fill(.green)
        }
        .frame(height: 100)
    }
}

#Preview {
    EffectsTest()
}
