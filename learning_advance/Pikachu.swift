//
//  Pikachu.swift
//  learning_swiftui
//
//  Created by Anthony Rubio on 6/08/24.
//

import SwiftUI

struct Pikachu: View {
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            HStack {
                Spacer()
                
                ZStack{
                    EairsPikachuView(
                        width: width, height: height
                    )
                    HeadPikachuShape()
                        .fill(.yellow)
                        .frame(
                            width: width * 0.5,
                            height: height * 0.25)
//                        .overlay{
//                            HeadPikachuShape()
//                                .strokedLine()
//                        }
                        
                    FacePikachuView(
                        width: width * 0.4,
                        height: height * 0.25)
                    
                }
                Spacer()
               
            }.frame(width: width * 0.8,height: height * 0.6)
        }
       
    }
}

struct EyesPicackuView : View {
    var edgeTop : Edge.Set
    var edgeSide : Edge.Set
    
    var body: some View{
           ZStack{
                Circle()
                VStack (alignment: .trailing){
                    Circle()
                        .fill(Color.white)
                        .frame(width: 10, height: 10)
                        .padding(edgeTop, 10)
                        .padding(edgeSide, 5)
                    
                }
                
            }
            .frame(width: 30,height: 30)
        
    }
}


struct MouthPikachuShape : Shape {
    func path(in rect: CGRect) -> Path {
        Path{ path in
            //Bottom mouth
            path.move(to: CGPoint(x: rect.minX + 2, y: rect.minY + 2))
            path.addQuadCurve(to:CGPoint(x: rect.maxX, y: rect.minY + 5),
                              control: CGPoint(x: rect.midX, y: rect.maxY))
            //top mouth
            path.move(to: CGPoint(x: rect.minX - 6, y: rect.minY - 5))
            path.addQuadCurve(to:CGPoint(x: rect.midX - 4, y: rect.minY - 6),
                              control: CGPoint(x: 3, y: 10))
            
            path.move(to: CGPoint(x: rect.maxX + 6, y: rect.minY + 2))
            path.addQuadCurve(to:CGPoint(x: rect.midX - 4, y: rect.minY - 6),
                              control: CGPoint(x: rect.midX + 30, y: 10))
 
            
        }
    }
}


struct DeepMouthPikachuShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX + 9, y: rect.minY + 19))
        path.addQuadCurve(to: CGPoint(x: rect.minX + 17, y: rect.minY ),
                          control: CGPoint(x: rect.minX + 10, y: rect.minY + 10))
        path.addQuadCurve(to: CGPoint(x: rect.minX, y: rect.minY + 2),
                          control: CGPoint(x: rect.minX + 10, y: rect.minY + 5))
        path.closeSubpath()
        return path
    }
}


struct TonguePikachuShape : Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX + 10, y: rect.minY + 19))
        path.addQuadCurve(to: CGPoint(x: rect.minX + 18, y: rect.minY ),
                          control: CGPoint(x: rect.minX + 10, y: rect.minY + 10))
        path.addLine(to: CGPoint(x: rect.midX - 5, y: rect.minY - 3))
        
        path.addLine(to: CGPoint(x: rect.maxX - 3, y: rect.minY + 7))
        path.addQuadCurve(to: CGPoint(x: rect.minX + 10, y: rect.minY + 19), control: CGPoint(x: rect.midX, y: rect.maxY - 12))
        path.closeSubpath()
        return path
    }
}



struct NosePikachuShape : Shape{
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

#Preview {
    Pikachu()
}




struct FacePikachuView: View {
    var width : Double
    var height : Double
    var body: some View {
        VStack (alignment: .center){
            Spacer()
            HStack (alignment: .center,spacing: .zero){
                
                EyesPicackuView(
                    edgeTop: .bottom,
                    edgeSide: .leading)
                .padding(.trailing,15)
                .padding(.bottom,10)
                
                NosePikachuShape()
                    .stroke(Color.black, style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round))
                    .fill()
                    .rotationEffect(Angle(degrees: 190))
                    .frame(width: 10,height: 5)
                    .offset(x: 10.0,y: +8)
                EyesPicackuView(
                    edgeTop: .bottom,
                    edgeSide: .trailing)
                .padding(.leading, 40)
                
            }
            ZStack {
                MouthPikachuShape()
                    .strokedLine()
                    .frame(width: 60,height: 90)
                    .overlay{
                        DeepMouthPikachuShape()
                            .fill(.black)
                        TonguePikachuShape()
                            .fill(.red)
                    }
                    
                HStack (alignment: .center){
                    Circle()
                        .trim(from: 0, to: 0.7)
                        .fill(.red)
                        .frame(width: 35)
                        .rotationEffect(Angle(degrees: -130))
                        .offset(x: -14, y: -32)
                        .overlay{
                            Circle()
                                .trim(from: 0, to: 0.7)
                                .strokedLine()
                                .frame(width: 35)
                                .rotationEffect(Angle(degrees: -130))
                                .offset(x: -14, y: -32)
                                
                        }
                    Spacer()
                    Circle()
                        .fill(.red)
                        .frame(width: 35)
                        .offset(x: 8,y: -20)
                        .overlay{
                            Circle()
                                .strokedLine()
                                .frame(width: 35)
                                .offset(x: 8,y: -20)
                        }
                }
                
                    
            }
            
            
        }.frame(width: width,height: height)
    }
}



struct HeadPikachuShape : Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // Start from left cheek
        path.move(to: CGPoint(x: rect.minX + 35, y: rect.minY + 20))
        path.addQuadCurve(to: CGPoint(x: rect.minX + 20, y: rect.midY - 25),
                          control: CGPoint(x: rect.minX + 20, y: rect.minY + 35))
        
        // Connect to bottom left of head
        path.addQuadCurve(to: CGPoint(x: rect.midX - 20, y: rect.maxY - 10),
                          control: CGPoint(x: rect.minX - 15, y: rect.midY + 50))
        
        // Connect to bottom right of head
        path.addLine(to: CGPoint(x: rect.maxX - 50, y: rect.maxY - 5))
        
        // Move up to right cheek
        path.addQuadCurve(to: CGPoint(x: rect.maxX - 2, y: rect.midY - 5),
                          control: CGPoint(x: rect.maxX, y: rect.maxY - 15))
        
        // Move up to top right
        path.addQuadCurve(to: CGPoint(x: rect.maxX - 40, y: rect.minY + 15),
                          control: CGPoint(x: rect.maxX + 3, y: rect.midY - 30))
        
        // Top head curve back to start
        path.addQuadCurve(to: CGPoint(x: rect.minX + 35, y: rect.minY + 20),
                          control: CGPoint(x: rect.midX, y: rect.minY))
        path.closeSubpath()
        return path
    }
}

struct TopEarShape : Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX - 3, y: rect.minY + 75))
        path.addQuadCurve(to: CGPoint(x: rect.maxX + 3, y: rect.minY + 45), control: CGPoint(x: rect.midX, y: rect.minY - 10))
        path.addQuadCurve(to:CGPoint(x: rect.minX - 3, y: rect.minY + 75), control: CGPoint(x: rect.midX, y: rect.minY + 45))
        path.closeSubpath()
        return path
    }
}



struct EarShape : Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        // Start at the bottom left
        path.move(to: CGPoint(x: rect.minX - 5, y: rect.maxY))
        
        // Draw the left curve
        path.addQuadCurve(to: CGPoint(x: rect.minX, y: rect.minY + 70), control: CGPoint(x: rect.minX - 10, y: rect.midY + 30))
        
        // Draw the top curve
        path.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.minY + 40), control: CGPoint(x: rect.midX, y: rect.midY - 30))
        
        // Draw the right curve
        path.addQuadCurve(to: CGPoint(x: rect.maxX + 5, y: rect.maxY - 10), control: CGPoint(x: rect.maxX + 10, y: rect.maxY - 30))
        
        // Close the path by drawing a line back to the starting point
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        
        // Use closeSubpath() to ensure the path is closed and fills properly
        path.closeSubpath()
        
        return path
    }
}



struct StrokedShape<S: Shape>: View {
    var shape: S
    var color: Color
    var lineWidth: CGFloat
    var lineCap: CGLineCap
    var lineJoin: CGLineJoin
    
    var body: some View {
        shape
            .stroke(color, style: StrokeStyle(lineWidth: lineWidth, lineCap: lineCap, lineJoin: lineJoin))
    }
}

extension View where Self: Shape {
    func strokedLine(color: Color = .black, lineWidth: CGFloat = 4, lineCap: CGLineCap = .round, lineJoin: CGLineJoin = .round) -> some View {
        StrokedShape(shape: self, color: color, lineWidth: lineWidth, lineCap: lineCap, lineJoin: lineJoin)
    }
}



struct EairsPikachuView: View {
    var width : Double
    var height: Double
    var body: some View {
        VStack {
            HStack {
                EarShape()
                    .fill(.yellow)
                    .frame(width: 30,height: 150)
                    .overlay{
                        TopEarShape()
                            .fill(.black)
//                        EarShape()
//                            .strokedLine()
                    }.offset(x: 35,y: -5)
                    .rotationEffect(Angle(degrees: 3))
                Spacer()
                EarShape()
                    .fill(.yellow)
                    .frame(width: 30,height: 150)
                    .overlay{
                        TopEarShape()
                            .fill(.black)
//                        EarShape()
//                            .strokedLine()
                    }
                    .scaleEffect(x: -1, y: 1)
                    .rotationEffect(Angle(degrees: 65))
                    .offset(x: 40,y: 45)
                
            }.frame(
                width: width * 0.5,
                height: height * 0.25)
            Spacer()
        }
    }
}
