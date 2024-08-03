//
//  Navigation.swift
//  learning_swiftui
//
//  Created by Anthony Rubio on 6/07/24.
//

import SwiftUI

struct Navigation: View {
   
    var body: some View {
        NavigationStack {
            VStack {
                Text("Hello, World!").navigationTitle("Home")
                    .navigationBarTitleDisplayMode(.inline).toolbar(content: {
                        ToolbarItem(placement: .navigationBarTrailing, content: {
                            NavigationLink("+", destination: DividersView())
                        })
                    })
                NavigationLink("Go to views", destination: Tabviews())
                NavigationLink("Go to ImagesView") {
                                   ImagesView()
                               }
                
            }
            
        }
    }
}

