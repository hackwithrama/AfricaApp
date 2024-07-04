//
//  VideoModel.swift
//  AfricaApp
//
//  Created by Ramachandran Varadaraju on 03/07/24.
//

import SwiftUI

struct Video: Codable, Identifiable, Hashable{
    let id: String
    let name: String
    let headline: String
    
    var thumbnail: String{
        return "video-\(id)"
    }
}
