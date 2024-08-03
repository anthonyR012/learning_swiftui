

import SwiftUI

struct TextModified: View{
    var body : some View{
        VStack {
           Text("Hello, world!")
                .font(.largeTitle)
                .foregroundStyle(
                    .red)
                .frame(width: 500,
                       height: 100,
                       alignment: .center)
        }
        .padding()
        .background(
            .blue)
    }
}

