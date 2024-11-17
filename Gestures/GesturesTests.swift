//
//  GesturesTests.swift
//  SwiftuiBook
//
//  Created by Michail Malashkevich on 16.11.24.
//

import SwiftUI

struct GesturesTests: View {
    @State var circlePosition = CGPoint.zero
    @GestureState var isDragging: Bool = false
    @State var colorToPink = false
    
    @State var currentSlidePositionX: CGFloat = 0
    @GestureState var slideOffset: CGSize = .zero
    @State var someSize: (CGFloat, CGFloat)?
    
    @State var isLongPressing = false
    @State var isPressing = false

    @GestureState var scale: CGFloat = 1
   
    @State var doubleTapped = false
    
    var body: some View {
        ScrollView {
            // 1 drag
            VStack {
                Text("Drag field 💅 \(String(isDragging))")
                Text("Geo: \(someSize?.0 ?? 0) and \(someSize?.1 ?? 0)")
                
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.red, lineWidth: 5)
                    .frame(width: .infinity, height: 350)
                    .overlay {
                        Circle()
                            .fill(colorToPink ?.pink : .blue)
                            .frame(width: 50, height: 50)
                            .position(circlePosition)
                            .border(.red)
                            .gesture(DragGesture().onChanged({ value in
                                circlePosition = value.location
                            }).updating($isDragging) { (value, state, transaction) in
                                state = true
                            }
                                .onEnded { value in
                                    colorToPink = value.location.x > 100 ? true : false
                                }
                            )
                    }
                
                GeometryReader { geo in
                    HStack {
                        Spacer()
                        Image(systemName: "line.horizontal.3")
                            .rotationEffect(.degrees(90))
                    }
                    .frame(height: 100)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(.blue))
                    .foregroundStyle(.white)
                    .offset(x: currentSlidePositionX + slideOffset.width)
                    .gesture(DragGesture(minimumDistance: 10) // MARK: Min distance before start moving
                        .updating($slideOffset) { (value, state, transaction) in
                            state = value.translation
                        }
                        .onEnded { value in
                            if value.translation.width < -geo.size.width * 0.6 {
                                currentSlidePositionX = 50 - geo.size.width
                                someSize = (-geo.size.width * 0.6, 50 - geo.size.width)
                                
                            } else {
                                currentSlidePositionX = 0
                            }
                            
                        }
                    )
                    
                   
                }
                .padding(.bottom, 130)
                
                // MARK: Long
                Image(systemName: isLongPressing ? "lock.open.fill" : "lock.fill")
                    .font(.largeTitle)
                    .foregroundStyle(isLongPressing ? .green : .red)
                    .onLongPressGesture(minimumDuration: 1, pressing: { isPressing in
                        self.isPressing = isPressing
                    }) {
                        isLongPressing.toggle()
                    }
                
                // MARK: Magnet
                // to emulate hold option, to move fingers hold shift
                Image("Grad")
                    .scaleEffect(scale)
                    .gesture(MagnificationGesture().updating($scale, body: { (value, state, transaction) in
                        state = value.magnitude
                    }))
                
                // MARK: Rotation gesture
                // skip

               // MARK: On tap
                Image(systemName: doubleTapped ? "envelope.open.fill" : "envelope.fill")
                    .onTapGesture(count: 2) {
                        doubleTapped.toggle()
                    }
                    .padding(.top)
    
                
                
                // MARK: Simultaneous, multiple at the same time
                // MARK: Sequence - sequence of them :)
            }
            .padding()
        }
    }
}

#Preview {
    GesturesTests()
}
