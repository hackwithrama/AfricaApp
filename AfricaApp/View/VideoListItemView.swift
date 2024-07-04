//
//  VideoListItem.swift
//  AfricaApp
//
//  Created by Ramachandran Varadaraju on 03/07/24.
//

import SwiftUI

struct VideoListItemView: View {
    let video: Video
    
    var body: some View {
        HStack(spacing: 10){
            Image(video.thumbnail)
                .resizable()
                .scaledToFit()
                .cornerRadius(16)
                .frame(width: 90, height: 90)
                .overlay(
                    Image(systemName: "play.circle")
                        .imageScale(.large)
                        .fontWeight(.bold)
                )
            VStack(alignment: .leading, spacing: 10){
                Text(video.name)
                    .foregroundColor(.accentColor)
                    .font(.title2)
                    .fontWeight(.heavy)
                Text(video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }
        }
    }
}

#Preview {
    let videos: [Video] = Bundle.main.decode("videos.json")
    return VideoListItemView(video: videos[3])
}
