//
//  Tabviews.swift
//  learning_swiftui
//
//  Created by Anthony Rubio on 6/07/24.
//


import Foundation
import SwiftUI

struct Tabviews: View {
    @State var course : String = "Android"
    
    var body : some View {
        TabView(content: {
            TextModified().tabItem {
               Text("Scree1")
                Image(systemName: "square.and.arrow.up")
            }
            TextFieldView().tabItem {
                Text("Scree2")
                 Image(systemName: "mic")
             }
            ZStackView().tabItem {
                Text("Scree3")
                 Image(systemName: "terminal")
             }
            
        })
    }
    
   
}

