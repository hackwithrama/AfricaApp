//
//  InsetFactView.swift
//  AfricaApp
//
//  Created by Ramachandran Varadaraju on 03/07/24.
//

import SwiftUI

struct InsetFactView: View {
    let animal: Animal
    var body: some View {
        GroupBox{
            TabView{
                ForEach(animal.fact, id: \.self){item in
                    Text(item)
                        .multilineTextAlignment(.center)
                }
            }
            .tabViewStyle(.page)
        }
    }
}

#Preview {
    let animals: [Animal] = Bundle.main.decode("animals.json")
    return InsetFactView(animal: animals[0])
}
