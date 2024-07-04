//
//  VideoPlayerHelper.swift
//  AfricaApp
//
//  Created by Ramachandran Varadaraju on 03/07/24.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer?

func playVideo(fileName: String, fileExtension: String) -> AVPlayer{
    guard let url = Bundle.main.url(forResource: fileName, withExtension: fileExtension) else {
        fatalError("Failed to locate \(fileName) in the bundle")
    }
    
    videoPlayer = AVPlayer(url: url)
    videoPlayer?.play()
    
    return videoPlayer!
}
