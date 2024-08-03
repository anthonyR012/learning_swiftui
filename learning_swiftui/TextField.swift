//
//  TextField.swift
//  learning_swiftui
//
//  Created by Anthony Rubio on 2/07/24.
//

import Foundation

import SwiftUI

struct TextFieldView: View {
    @State var textView: String = "" //@State help us to mantain the state
    var body : some View{
        VStack {
            Text(textView).bold() //anything that is linked to you view, we have to mantein it
            
            TextField("Write password", text: $textView)//*binding, join value with our variable
            Button(action: {
//                textView = "Anthony" will throw an error, cannot modified
                //we have to notify to swift that the value can change propertyWrapper
                textView = "Anthony"
            }, label: {
                Text("Change text view")
            })
        }
    }
    
   
}


