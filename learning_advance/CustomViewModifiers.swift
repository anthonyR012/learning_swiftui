//
//  CustomViewModifiers.swift
//  learning_swiftui
//
//  Created by Anthony Rubio on 3/08/24.
//

import Foundation
import SwiftUI

struct DefaultBottonViewModifier: ViewModifier{
    let backgroundColor : Color  //can received parameters
    func body(content: Content) -> some View {//add those modifiers to the view
        content
            .font(.headline)
            .foregroundStyle(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(backgroundColor)
            )
            .shadow(radius: 10)
            .padding()
    }
}

extension View{//Create an extension of our protocol
    func withDefaultButtonFormatting(backgroundColor : Color = .blue) -> some View {//Can received parameters
        self.modifier(DefaultBottonViewModifier(
            backgroundColor: .blue
        ))
    }
}

struct CustomViewModifiers: View {
    var body: some View {
        VStack{
            Text("Hello World")
                .withDefaultButtonFormatting()  //blue for default
            Text("Hello World")
                .modifier(DefaultBottonViewModifier(backgroundColor: .red))
            Text("Hello World")
                .modifier(DefaultBottonViewModifier(backgroundColor: .red))
        }
    }
}

#Preview{
    CustomViewModifiers()
}
