//
//  AnimalListItemView.swift
//  AfricaApp
//
//  Created by Ramachandran Varadaraju on 02/07/24.
//

import SwiftUI

struct AnimalListItemView: View {
    // MARK: PROPERTIES
    let animal: Animal
    
    var body: some View {
        HStack(alignment: .center, spacing: 16){
            Image(animal.image)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .clipShape(
                    RoundedRectangle(cornerRadius: 12)
                )
            
            VStack(alignment: .leading, spacing: 8){
                Text(animal.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                Text(animal.headline)
                    .multilineTextAlignment(.leading)
                    .font(.footnote)
                    .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                    .padding(.trailing, 8)
            }
        }//: HStack
    }
}

#Preview {
    let animals: [Animal] = Bundle.main.decode("animals.json")
    return AnimalListItemView(animal: animals[0])
}
