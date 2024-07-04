//
//  HeadingView.swift
//  AfricaApp
//
//  Created by Ramachandran Varadaraju on 03/07/24.
//

import SwiftUI

struct HeadingView: View {
    // MARK: PROPERTIES
    var headingImage: String
    var headingText: String
    
    var body: some View {
        HStack{
            Image(systemName: headingImage)
                .foregroundColor(.accentColor)
                .imageScale(.large)

            Text(headingText)
                .font(.title3)
                .fontWeight(.bold)
        }
    }
}

#Preview {
    HeadingView(headingImage: "photo", headingText: "Image gallery")
}
