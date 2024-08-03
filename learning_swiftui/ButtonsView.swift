//
//  ButtonsView.swift
//  learning_swiftui
//
//  Created by Anthony Rubio on 23/06/24.
//

import SwiftUI

struct ButtonsView: View {
    var body : some View{
        VStack {
            Button("My first Button",
                   action: {
                print("Hello world")
            })
            Button("My Second Button") {
                print("tap")
            }
            Button {sayHi()} label: {
                Text("Button with label")
                    .padding(10)
                    .foregroundStyle(.white)
                    .background(Color.blue)
                    
            }

        }
    }
    
    func sayHi(){
        print("label is a view")
    }
}

