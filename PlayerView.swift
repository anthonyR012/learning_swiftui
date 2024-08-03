//
//  PlayerView.swift
//  learning_swiftui
//
//  Created by Anthony Rubio on 6/07/24.
//

import SwiftUI
import AVKit

struct PlayerView: View {
    var body: some View {
        NavigationStack(root: {
            NavigationLink (destination: PlayerPlay()){
                
                ZStack(content: {
                    
                    Image("cuphead").resizable().aspectRatio(contentMode: .fit)
                    Circle().frame(width: 50,height: 50).opacity(0.7)
                    Image(systemName: "play.fill").foregroundColor(.white)
                    
                })
            }.foregroundColor(.black)
            })
    }
}

struct PlayerPlay : View{
    var body: some View {
        VideoPlayer(player: AVPlayer(url: URL(string: "https://cdn.cloudflare.steamstatic.com/steam/apps/256705156/movie480.mp4")!))
            .frame(width: 420,height: 360)
            
    }
}

