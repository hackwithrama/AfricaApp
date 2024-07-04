//
//  AnimalGridItemView.swift
//  AfricaApp
//
//  Created by Ramachandran Varadaraju on 04/07/24.
//

import SwiftUI

struct AnimalGridItemView: View {
    let animal: Animal
    
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

#Preview {
    let animals: [Animal] = Bundle.main.decode("animals.json")
    return AnimalGridItemView(animal: animals[0])
}
