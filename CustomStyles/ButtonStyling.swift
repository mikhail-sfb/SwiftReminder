//
//  ButtonStyling.swift
//  SwiftuiBook
//
//  Created by Michail Malashkevich on 16.11.24.
//

import SwiftUI

struct ButtonStyling: View {
    var body: some View {
        Button("Using custom style") {
            
        }
        .buttonStyle(OutlineButtonStyle(foregroudColor: .red))
        
        Button("Using custom style") {
            
        }
        .buttonStyle(OutlineButtonStyle())
        
        
    }
}

struct OutlineButtonStyle: ButtonStyle {
    var foregroudColor: Color = .blue
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.2 : 1)
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).strokeBorder(foregroudColor, lineWidth: 2))
            .foregroundStyle(foregroudColor)
    }
}

#Preview {
    ButtonStyling()
}
