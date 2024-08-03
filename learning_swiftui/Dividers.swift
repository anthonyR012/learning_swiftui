//
//  Dividers.swift
//  learning_swiftui
//
//  Created by Anthony Rubio on 2/07/24.
//


import Foundation

import SwiftUI

struct DividersView: View {
    var body : some View{
        VStack {
            
            Circle().frame(
                width: 100,
                height: 100,
                alignment: .center)
            Text("Black Circle")
            Divider().frame(width: 200)
                .background(
                Color.red)
            Rectangle().foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .frame(
                    width: 200,
                    height: 100)
            Text("Blue Rect")
            
        }
    }
    
   
}
