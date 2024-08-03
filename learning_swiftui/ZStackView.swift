//
//  ZStackView.swift
//  learning_swiftui
//
//  Created by Anthony Rubio on 5/07/24.
//

import Foundation
import SwiftUI

struct ZStackView: View {
    @State var course : String = "Android"
    
    var body : some View {
        ZStack(content: {
            Color.yellow
            VerticalContent()
          
        })
    }
    
   
}

struct VerticalContent : View{
    var body: some View {
        VStack(content: {
            MyImagesView()
            Text("Anthony Rubioooo").padding()
            TestView()
        })
    }
}


struct MyImagesView: View {
    var body: some View {
        VStack {
            Image("firebase").resizable()
                .aspectRatio(contentMode: .fit)
            .frame(width: 100,height: 100)
            Image("firebase").resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100,height: 100)
            Image("firebase").resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100,height: 100)
        }
    }
}
