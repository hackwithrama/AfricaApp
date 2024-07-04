//
//  ContentView.swift
//  AfricaApp
//
//  Created by Ramachandran Varadaraju on 02/07/24.
//

import SwiftUI

struct ContentView: View {
    // MARK: PROPERTIES
    let animals: [Animal] = Bundle.main.decode("animals.json")
    
    @State private var isGridViewActive = false
    
//    let gridLayout = Array(repeating: GridItem(.flexible()), count: 2)
    
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Int = 1
    @State private var toolBarIcons: String = "square.grid.2x2"
    
    func changeGridView(){
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        
        switch gridColumn{
        case 1:
            toolBarIcons = "rectangle.grid.1x2"
        case 2:
            toolBarIcons = "square.grid.2x2"
        case 3:
            toolBarIcons = "rectangle.grid.3x2"
        default:
            toolBarIcons = "square.grid.2x2"
        }
    }
    
    var body: some View {
        NavigationStack{
            Group{
                if !isGridViewActive {
                    List{
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        ForEach(animals){animal in
                            NavigationLink{
                                AnimalDetailView(animal: animal)
                            }label: {
                                AnimalListItemView(animal: animal)
                            }
                        }
                    }//: List
                } else {
                    ScrollView(.vertical, showsIndicators: false){
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10){
                            ForEach(animals) {animal in
                                NavigationLink{
                                    AnimalDetailView(animal: animal)
                                }label: {
                                    AnimalGridItemView(animal: animal)
                                }
                            }
                        }//: Grid
                        .padding(10)
                    }
                }//: Condition
            }//: Group
            .navigationTitle("Africa")
            .toolbar{
                HStack(spacing: 10){
                    // list
                    Button{
                        print("List view is activated")
                        withAnimation(Animation.easeIn){
                            isGridViewActive = false
                        }
                    }label: {
                        Image(systemName: "square.fill.text.grid.1x2")
                            .font(.title2)
                            .foregroundColor(isGridViewActive ? .primary : .accentColor)
                    }
                    
                    // grid
                    Button{
                        print("Grid view is activated")
                        withAnimation(Animation.easeIn){
                            isGridViewActive = true
                            changeGridView()
                        }
                    }label: {
                        Image(systemName: toolBarIcons)
                            .font(.title2)
                            .foregroundColor(isGridViewActive ? .accentColor : .primary)
                    }
                }
            }
        }//: NavigationStack
    }
}

#Preview {
    ContentView()
}
