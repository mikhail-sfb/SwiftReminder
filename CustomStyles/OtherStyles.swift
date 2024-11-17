//
//  GroupBoxStyling.swift
//  SwiftuiBook
//
//  Created by Michail Malashkevich on 16.11.24.
//

import SwiftUI

struct GroupBoxStyling: View {
    @State var progressAmount: CGFloat = 0.25
    @State var isOn: Bool = false
    
    var body: some View {
        // no style
        GroupBox(label: Text("Username")) {
            Text("Swift4Ever")
        }
        
        GroupBox(label: Text("Username")) {
            Text("Swift4Ever")
        }
        .groupBoxStyle(CenteredGroupBoxStyle())
        
        Menu {
            Text("Username")
        } label: {
            Button(action: {}) {
                Image(systemName: "person.crop.circle.fill")
                Text("Change info")
            }
        }
        .menuStyle(BorderMenuStyle())
        
        ProgressView("ATM", value: progressAmount)
            .progressViewStyle(GaugeProgressViewStyle())
            .padding(.all, 50)
        
        Slider(value: $progressAmount)
            .padding()
        
        Toggle("Style", isOn: $isOn)
            .toggleStyle(CheckmarkToggleStyle())
            .padding()
    }
}

struct CheckmarkToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
                .font(.title)
            
            Spacer()
            
            Button {
                configuration.isOn.toggle()
            } label: {
                Circle()
                    .fill(configuration.isOn ? .red : .green)
                    .frame(width: 40, height: 40)
                    .overlay {
                        Image(systemName: configuration.isOn ? "checkmark" : "xmark")
                            .foregroundStyle(.black)
                        
                    }
            }
        }
    }
}

struct GaugeProgressViewStyle: ProgressViewStyle {
    let ag = AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green]), center: .center, startAngle: .degrees(-5), endAngle: .degrees(270))

    func makeBody(configuration: Configuration) -> some View {
        let percent = Double(configuration.fractionCompleted ?? 0)
        
        return GeometryReader { gr in
            ZStack {
                // Background arc
                Circle()
                    .trim(from: 0, to: 0.8)
                    .stroke(ag, style: StrokeStyle(lineWidth: 40, lineCap: .round))
                    .rotationEffect(.degrees(125))
                
                // Moving indicator circle
                Circle()
                    .strokeBorder(.black, lineWidth: 5)
                    .frame(width: 36, height: 36)
                    .offset(y: -gr.size.width / 2.15)
                    .rotationEffect(.degrees(215 + (percent * 0.8 * 360)))
                
                // Progress text
                Text("\(Int(percent * 100))")
                    .font(.system(size: 100, weight: .bold, design: .rounded))
                
                configuration.label
                    .font(.system(.title, design: .rounded).bold())
                    .frame(maxWidth: .infinity, alignment: .bottom)
                    .frame(width: 100)
                    .lineLimit(2)
                    .offset(y: gr.size.height / 2.8)
            }
            .frame(width: min(gr.size.height, gr.size.width), height: min(gr.size.height, gr.size.width))
        }
    }
}


struct BorderMenuStyle: MenuStyle {
    func makeBody(configuration: Configuration) -> some View {
        Menu(configuration)
            .padding()
            .background(RoundedRectangle(cornerRadius: 15).stroke(.purple, lineWidth: 3))
    }
}

struct CenteredGroupBoxStyle: GroupBoxStyle {
        func makeBody(configuration: Configuration) -> some View {
            VStack {
                configuration.label
                    .font(.largeTitle)
                    .foregroundStyle(.secondary)
                configuration.content
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Rectangle().fill(.purple.opacity(0.2)))
    }
}

#Preview {
    GroupBoxStyling()
}
