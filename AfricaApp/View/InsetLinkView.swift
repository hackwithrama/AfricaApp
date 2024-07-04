//
//  InsetLinkView.swift
//  AfricaApp
//
//  Created by Ramachandran Varadaraju on 03/07/24.
//

import SwiftUI

struct InsetLinkView: View {
    let animal: Animal
    var body: some View {
        GroupBox{
            HStack{
                Text("For more info visit")
                Spacer()
                Link(destination: URL(string: animal.link)!, label: {
                    HStack {
                        Text("Wikipedia")
                        Image(systemName: "globe")
                    }
                })
                
            }
        }
    }
}

#Preview {
    let animals: [Animal] = Bundle.main.decode("animals.json")
    return InsetLinkView(animal: animals[0])
}
