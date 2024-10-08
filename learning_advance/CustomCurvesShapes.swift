//
//  CustomCurvesShapes.swift
//  learning_swiftui
//
//  Created by Anthony Rubio on 6/08/24.
//

import SwiftUI

struct CustomCurvesShapes: View {
    var body: some View {
        WaterShape()
            .fill(
             LinearGradient(gradient: Gradient(
                colors: [Color.blue.opacity(0.7), Color.blue]),
                            startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/
                            
                            , endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
            )
//            .stroke(lineWidth: 5)
//            .frame(width: 200,height: 200)
            .ignoresSafeArea()
            
    }
}


struct ArcSample : Shape {
    func path(in rect: CGRect) -> Path {
        Path{ path in
            path.move(to: CGPoint(x: rect.midX, y: rect.midY))
            path.addArc(
                center: CGPoint(x: rect.midX, y: rect.midY),
                radius: rect.height / 2,
                startAngle: Angle(degrees: 0),
                endAngle: Angle(degrees: 40),
                clockwise: true)
        }
    }
}


struct ShapeWithArc : Shape {
    func path(in rect: CGRect) -> Path {
        Path{ path in
            //top left
            path.move(to: CGPoint(x: rect.minX, y: rect.minY))
            // top right
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            
            //mid right
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
            
            //bottom
//            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
            path.addArc(
                center: CGPoint(x: rect.midX, y: rect.midY - 65),
                radius: rect.height / 2,
                startAngle: Angle(degrees: 0),
                endAngle: Angle(degrees: 180),
                clockwise: false)
            //mid left
            path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
            
            
            path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        }
    }
}


struct QuadSample: Shape {
    func path(in rect: CGRect) -> Path {
        Path{ path in
            path.move(to: .zero)
            path.addQuadCurve(
                to: CGPoint(x: rect.midX, y: rect.midY),
                control: CGPoint(x: rect.minX, y: rect.midY))
            
        }
    }
}


struct WaterShape : Shape {
    func path(in rect: CGRect) -> Path {
        
        Path { path in
            path.move(to: CGPoint(x: rect.minX, y: rect.midY))
            
            path.addQuadCurve(to: CGPoint(x: rect.midX, y: rect.midY),
                              control: CGPoint(x: rect.width * 0.25, y: rect.height * 0.25))
            path.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.midY),
                              control: CGPoint(x: rect.width * 0.75, y: rect.height * 0.75))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        }
    }
}


