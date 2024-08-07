//
//  CustomShapes.swift
//  learning_swiftui
//
//  Created by Anthony Rubio on 5/08/24.
//

import SwiftUI

struct Triangule : Shape{
    func path(in rect: CGRect) -> Path {
        Path {
            path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        }
    }
}

struct Diamond : Shape{
    func path(in rect: CGRect) -> Path {
        Path {
            path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        }
    }
}


struct Trapezoid : Shape {
    func path(in rect: CGRect) -> Path {
        Path{
            path in
            let horizontalOffeset: CGFloat = rect.width * 0.2
            path.move(to: CGPoint(x: rect.minX + horizontalOffeset,
                                  y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX - horizontalOffeset, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX + horizontalOffeset, y: rect.minY))
            
        }
    }
}




struct CustomShapes: View {
    var body: some View {
        ZStack{
            Trapezoid()
                .frame(width: 350,height: 70)
            
            
//            Image("play")
//                .resizable()
//                .scaledToFill()
//                .frame(width: 300,height: 300)
//                .clipShape(Triangule()
//                    .rotation(Angle(degrees: 180)))
            
            
//            Triangule()
//                .fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
//                .frame(width: 300,height: 300)
            
        }
    }
}
