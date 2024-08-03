//
//  CustomButtonStyle.swift
//  learning_swiftui
//
//  Created by Anthony Rubio on 3/08/24.
//

import SwiftUI

struct PressableButtonStyle : ButtonStyle { //conform ButtonStyle protocol
    
    let scaledAmount : CGFloat
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .brightness(configuration.isPressed ? 0.1 : 0)
            .opacity(configuration.isPressed ? 0.9 : 1.0)
            .scaleEffect(configuration.isPressed ? scaledAmount : 1.0)
    }
}

extension View {
    
    func withPressableStyle(scaledAmount: CGFloat = 0.9) -> some View {
        self.buttonStyle(PressableButtonStyle(scaledAmount: scaledAmount))//Style of my button can be customize
    }
}

struct CustomButtonStyle: View {
    var body: some View {
        Button(action: {
            
        }, label: {
            Text("Click Me")
                .withDefaultButtonFormatting()
            
        })
        .withPressableStyle(scaledAmount: 0.6)
    }
}

#Preview {
    CustomButtonStyle()
}
