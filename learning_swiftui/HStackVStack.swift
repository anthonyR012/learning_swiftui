//
//  HStackVStack.swift
//  learning_swiftui
//
//  Created by Anthony Rubio on 3/07/24.
//


import Foundation

import SwiftUI

struct HStackVStackView: View {
    var body : some View{
        VStack (alignment: .trailing) { //vertical
            Text("Placeholder1").border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            Text("Placeholder2")
            Text("Placeholder3")
            
            HStack { //horizontal
                Text("Colombia").frame(width: 100,height: 100)
                Text("Colombia")
                Text("Colombia")
            }.border(Color.blue)
        }.border(Color.red)
    }
    
   
}

struct TestView: View {
    var body : some View {
        VStack(alignment: .trailing,spacing: 0) { //vertical
            Text("1").border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            Text("2").border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            Text("3").border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            HStack (alignment: .top){
                Text("A").frame(width: 150,height: 150).border(Color.black)
                HStack {
                    Text("B").border(Color.black)
                    Text("C").border(Color.black)
                }
            }.background(Color.red)
        }.background(Color.blue)
    }
    
   
}
