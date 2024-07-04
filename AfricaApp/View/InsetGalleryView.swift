//
//  InsetGalleryView.swift
//  AfricaApp
//
//  Created by Ramachandran Varadaraju on 03/07/24.
//

import SwiftUI

struct InsetGalleryView: View {
    // MARK: PROPERTIES
    let animal: Animal
    
    var body: some View {
        TabView{
            ForEach(animal.gallery, id: \.self){item in
                Image(item)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(12)
            }
        }
        .tabViewStyle(.page)
    }
}

#Preview {
    let animals: [Animal] = Bundle.main.decode("animals.json")
    return InsetGalleryView(animal: animals[0])
}
