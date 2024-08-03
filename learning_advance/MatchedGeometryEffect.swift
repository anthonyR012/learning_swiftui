//
//  MatchedGeometryEffect.swift
//  learning_swiftui
//
//  Created by Anthony Rubio on 3/08/24.
//

import SwiftUI

struct MatchedGeometryEffect: View {
    @State private var isClicked : Bool = false
    @Namespace private var namespace
    
    var body: some View {
        VStack{
            if !isClicked {
                
                
                RoundedRectangle(cornerRadius: 25.0)
                    .matchedGeometryEffect(id: "rectangle", in: namespace)
                    .frame(width: 100,height: 100)
                //.offset(CGSize(width: 0, height: isClicked ? UIScreen.main.bounds.height * 0.75 //: 0))
                //animation
            }
            
            Spacer()
            if isClicked {
                RoundedRectangle(cornerRadius: 25.0)
                    .matchedGeometryEffect(id: "rectangle", in: namespace)
                    .frame(width: 300,height: 200)
            }
            
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(.red)
        .onTapGesture {
            withAnimation(.easeInOut) {
                isClicked.toggle()
            }
        }
    }
}


struct MatchedGeometryEffectExample : View {
    let categories : [ String] = ["Home", "Popular" , "Saved"]
    @State private var selected: String = ""
    @Namespace private var namespace
    
    var body: some View {
        HStack {
            ForEach(categories,id: \.self){
                category in
                ZStack (alignment: .bottom){
                    if selected == category {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.red.opacity(0.5))
                            .matchedGeometryEffect(id: "category_background", in: namespace)
                            .frame(width: 50,height: 2)
                    }
                    Text(category)
                        .foregroundStyle(selected == category ? .red : .black)
                }.frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .onTapGesture {
                        withAnimation(.spring()){
                            selected = category
                        }
                    }
            }
        }.padding()
    }
}

#Preview {
    MatchedGeometryEffectExample()
}
