//
//  VideoListView.swift
//  AfricaApp
//
//  Created by Ramachandran Varadaraju on 02/07/24.
//

import SwiftUI

struct VideoListView: View {
    @State private var videos: [Video] = Bundle.main.decode("videos.json")
    
    var body: some View {
        NavigationStack {
            List{
                ForEach(videos){video in
                    NavigationLink{
                        VideoPlayerView(video: video)
                    }label: {
                        VideoListItemView(video: video)
                    }
                    
                }
            }
            .navigationTitle("Videos")
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button{
                        videos.shuffle()
                    }label: {
                        Image(systemName: "shuffle.circle")
                            .font(.title2)
                    }
                }
            }
        }
    }
}

#Preview {
    VideoListView()
}
