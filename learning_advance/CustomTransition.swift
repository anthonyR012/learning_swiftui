//
//  CustomTransition.swift
//  learning_swiftui
//
//  Created by Anthony Rubio on 3/08/24.
//

import SwiftUI


struct RotateViewModifier : ViewModifier {
    let rotation: Double 
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(Angle(degrees: rotation))
            .offset(CGSize(width: rotation != 0 ? UIScreen.main.bounds.width : 0,
                           height:rotation != 0 ? UIScreen.main.bounds.height : 0))
    }
}

extension AnyTransition {
    static var rotating: AnyTransition {
       .modifier(//its not neccesary return or reference AnyTransition
            active: RotateViewModifier(rotation: 180),
            identity: RotateViewModifier(rotation: 0))
    }
    
    static func rotating (rotation: Double) -> AnyTransition {
        return AnyTransition.modifier(
            active: RotateViewModifier(rotation: rotation),
            identity: RotateViewModifier(rotation: 0))
    }
    
    static var rotateOn : AnyTransition {
        return AnyTransition.asymmetric(insertion: .rotating, removal: .move(edge: .leading))
    }
}

struct CustomTransition: View {
    
    @State private var showRectangle : Bool =  false
    
    var body: some View {
        VStack{
            Spacer()
            if showRectangle {
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: 250,height: 350)
                    .frame(maxWidth: .infinity,maxHeight: .infinity)
                    //.transition(.move(edge: .leading)) transition from position
                    //.transition(AnyTransition.scale.animation(.easeInOut)) transition of scale
//                    .transition(AnyTransition.rotating.animation(.easeInOut))
//                    .transition(.rotating(rotation: 390))
                    .transition(.rotateOn)
            }
            Spacer()
            Text("Click me!")
                .withDefaultButtonFormatting()
                .onTapGesture {
                    withAnimation(.easeOut(duration: 3.0)) { //declare that our state will execute an animation
                        showRectangle.toggle()
                    }
                }
        }
    }
}


