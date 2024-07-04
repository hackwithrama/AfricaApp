//
//  CoverImageView.swift
//  AfricaApp
//
//  Created by Ramachandran Varadaraju on 02/07/24.
//

import SwiftUI

struct CoverImageView: View {
    // MARK: PROPERTIES
    var coverImages: [CoverImage] = Bundle.main.decode("covers.json")
    
    // MARK: BODY
    var body: some View {
        TabView{
            ForEach(coverImages) { item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(.page)
    }
}


// MARK: PREVIEW
#Preview {
    CoverImageView()
}
