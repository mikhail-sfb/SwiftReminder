//
//  BackgroundCoordinatesFixed.swift
//  SwiftuiBook
//
//  Created by Michail Malashkevich on 16.11.24.
//

import SwiftUI

struct BackgroundCoordinatesFixed: View {
    @State var location = CGPoint.zero

    var body: some View {
        TabView {
            VStack {
                Spacer()

                Text("Hello, Depth!")

                Image(systemName: "02.square")
                    .foregroundStyle(.ultraThickMaterial)
                    .padding()
                    .background(.secondary)
                    .padding()
                    .background(.secondary)
                    .padding()
                    .background(.secondary)
                    .font(.largeTitle)

                Spacer()

                Divider()
                    .background(Color.cyan.opacity(0.1))

            }
            .tabItem {
                Image(systemName: "person.crop.circle")
                Text("Background")
            }

            VStack {
                Text("Hello, World 1!")

                Color.green
                    .frame(width: 200, height: 200)
                    .opacity(0.5)
                    .overlay(RedCircle(location: $location))
                    .coordinateSpace(.named("GreenNamed"))
                
                Text("Location: \(Int(location.x))x \(Int(location.y))y!")
            }
            .tabItem {
                Image(systemName: "person.crop.circle")
                Text("Coordinate space")
            }
            
            VStack {
                Form {
                    Section {
                        Text("Hello, World 2!")
                        
                        Text("This text is longer than the previous one. It should wrap to the next line. But it doesn't.")
                            .frame(height: 50)
                            .listRowBackground(Color.pink)
                        
                        Text("This text is longer than the previous one. It should wrap to the next line. But it doesn't.")
                            // MARK: Very usefull when we dynamically change width but have some restrictions
                            .fixedSize(horizontal: false, vertical: true)
                            .frame(height: 50)
                            .listRowBackground(Color.pink)
                    }
                    
                   
                }
                .formStyle(.grouped)
            }
            .tabItem {
                Image(systemName: "person.crop.circle")
                Text("Fixed Size")
            }
        }

    }
}

struct RedCircle: View {
    @Binding var location: CGPoint

    var body: some View {
        Circle()
            .fill(.red)
            .frame(width: 10, height: 10)
            .gesture(
                DragGesture(coordinateSpace: .named("GreenNamed")).onChanged({
                    location = $0.location
                }))
            .position(location)
    }
}

#Preview {
    BackgroundCoordinatesFixed()
}
