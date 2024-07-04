//
//  VideoPlayerView.swift
//  AfricaApp
//
//  Created by Ramachandran Varadaraju on 03/07/24.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    let video: Video
    var body: some View {
        VStack {
            VideoPlayer(player: playVideo(fileName: video.id, fileExtension: "mp4")){
                Text(video.name)
            }
            .overlay(
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding(8)
                , alignment: .topLeading
            )
        }
        .tint(.accentColor)
        .navigationTitle(video.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let videos: [Video] = Bundle.main.decode("videos.json")
    return VideoPlayerView(video: videos[0])
}
