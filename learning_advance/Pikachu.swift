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
                    HeadPikachuShape()
                        .strokedLine()
                        .frame(
                            width: width * 0.5,
                            height: height * 0.25)
                    FacePikachuView(
                        width: width * 0.4,
                        height: height * 0.25)
                }
                Spacer()
            }
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
            //tongue
            path.move(to: CGPoint(x: rect.minX + 9, y: rect.minY + 19))
            path.addQuadCurve(to: CGPoint(x: rect.minX + 20, y: rect.minY ),
                              control: CGPoint(x: rect.minX + 10, y: rect.minY + 10))
            
        }
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
            MouthPikachuShape()
                .strokedLine()
                .frame(width: 60,height: 90)
            
            
        }.frame(width: width,height: height)
    }
}



struct HeadPikachuShape : Shape {
    func path(in rect: CGRect) -> Path {
        Path{ path in
            //left cheek
            path.move(to: CGPoint(x: rect.minX + 35, y: rect.minY + 20))
            path.addQuadCurve(to: CGPoint(x: rect.minX + 20, y: rect.midY - 25),
                              control: CGPoint(x: rect.minX + 20, y: rect.minY + 35))
            path.move(to: CGPoint(x: rect.minX + 20, y: rect.midY - 25))
            path.addQuadCurve(to: CGPoint(x: rect.midX - 20, y: rect.maxY - 10),
                              control: CGPoint(x: rect.minX - 15, y: rect.midY + 50))
            //top head
            path.move(to: CGPoint(x: rect.minX + 60, y: rect.minY + 10 ))
            path.addQuadCurve(to: CGPoint(x: rect.maxX - 40, y: rect.minY + 15),
                              control: CGPoint(x: rect.midX, y: rect.minY))
            //right cheek
            path.move(to:  CGPoint(x: rect.maxX - 12, y: rect.minY + 45))
            
            path.addQuadCurve(to: CGPoint(x: rect.maxX - 1 , y: rect.midY - 5),
                              control: CGPoint(x: rect.maxX + 2, y: rect.midY - 30))
            path.move(to: CGPoint(x: rect.maxX - 1 , y: rect.midY - 5))
            path.addQuadCurve(to: CGPoint(x: rect.maxX - 50, y: rect.maxY - 5),
                              control: CGPoint(x: rect.maxX , y: rect.maxY - 15))
        }
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
