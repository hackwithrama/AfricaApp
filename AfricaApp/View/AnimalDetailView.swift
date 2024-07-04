//
//  AnimalDetailView.swift
//  AfricaApp
//
//  Created by Ramachandran Varadaraju on 03/07/24.
//

import SwiftUI

struct AnimalDetailView: View {
    // MARK: PROPERTIES
    var animal: Animal
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false){
                VStack(alignment: .center, spacing: 20){
                    // hero image
                    Image(animal.image)
                        .resizable()
                        .scaledToFit()
                    
                    // title
                    Text(animal.name.uppercased())
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 8)
                        .foregroundColor(.primary)
                        .background(
                            Color.accentColor
                                .frame(height: 6)
                                .offset(y: 25)
                            )
                    
                    // headline
                    Text(animal.headline)
                        .font(.headline)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.accentColor)
                        .padding(.horizontal)
                    
                    // gallery
                    Group{
                        HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wildreness in pictures")
                        InsetGalleryView(animal: animal)
                            .frame(height: 200)
                    }
                    .padding(.horizontal)
                    
                    // facts
                    Group{
                        HeadingView(headingImage: "questionmark.circle", headingText: "Did you know ?")
                        InsetFactView(animal: animal)
                            .frame(height: 200)
                    }
                    .padding(.horizontal)
                    
                    // description
                    Group{
                        HeadingView(headingImage: "info.circle", headingText: "All abount \(animal.name)")
                        Text(animal.description)
                            .multilineTextAlignment(.leading)
                            .layoutPriority(1)
                    }
                    .padding(.horizontal)
                    
                    // map
                    Group{
                        HeadingView(headingImage: "map", headingText: "National Park")
                        InsetMapView()
                            .frame(height: 300)
                            .cornerRadius(16)
                    }
                    .padding(.horizontal)
                    
                    // link
                    Group{
                        HeadingView(headingImage: "link.circle", headingText: "Learn more")
                        InsetLinkView(animal: animal)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 10)
                    
                }//: VStack
                .navigationTitle("Learn about \(animal.name)")
                .navigationBarTitleDisplayMode(.inline)
            }//: Scroll
        }//: Navigation
    }
}

#Preview {
    let animals: [Animal] = Bundle.main.decode("animals.json")
    return AnimalDetailView(animal: animals[0])
}
