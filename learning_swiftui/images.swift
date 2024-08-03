//
//  images.swift
//  learning_swiftui
//
//  Created by Anthony Rubio on 2/07/24.
//

import Foundation

import SwiftUI

struct ImagesView: View {
    var body : some View{
        VStack {
            Image("getting_started_1")//images
                .resizable()
                .aspectRatio(
                    contentMode: .fit
                    )
                .frame(width: 100,height: 100)
            Image("getting_started_1")
                .resizable()
                .aspectRatio(
                    contentMode: .fit
                    )
                .frame(width: 100,height: 100)
                .blur(radius: /*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
            Image("getting_started_1")
                .resizable()
                .aspectRatio(
                    contentMode: .fit
                    )
                .frame(width: 100,height: 100)
                .opacity(0.5)
            Button(action: { //button with image
                print("Ey")
            }, label: {
                Image("getting_started_1")
                    .resizable()
                    .aspectRatio(
                        contentMode: .fit
                        )
                    .frame(width: 100,height: 100)
                    .opacity(0.5)
            })
            Image(systemName: "moon.fill")//icons
            
        }
    }
    
   
}
