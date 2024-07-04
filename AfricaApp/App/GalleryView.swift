//
//  GalleryView.swift
//  AfricaApp
//
//  Created by Ramachandran Varadaraju on 02/07/24.
//

import SwiftUI

struct GalleryView: View {
    // MARK: PROPERTIES
    @State private var selectedAnimal: String = "lion"
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    
    // Simple grid defination
    //let gridLayout: [GridItem] = [
    //    GridItem(.flexible()),
    //    GridItem(.flexible()),
    //    GridItem(.flexible()),
    //]
    
    // Efficient grid defination
    //let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 4)
    
    // Dynamic grid layout
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0
    
    func gridSwitch(){
        gridLayout = Array(repeating: GridItem(.flexible()), count: Int(gridColumn))
    }
    
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false){
                // MARK: GRID
                VStack(alignment: .center, spacing: 30){
                    Image(selectedAnimal)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 256, height: 256)
                        .clipShape(Circle())
                        .overlay(
                            Circle()
                                .stroke(.white, lineWidth: 3)
                        )
                    
                    Slider(value: $gridColumn, in: 2...4, step: 1)
                        .padding(.horizontal)
//                        .onChange(of: gridColumn, perform: { value in
//                            gridSwitch()
//                        })
                        .onChange(of: gridColumn){
                            withAnimation(Animation.easeOut(duration: 0.5)){
                                gridSwitch()
                            }
                        }
                    
                    LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10){
                        ForEach(animals){animal in
                            Image(animal.image)
                                .resizable()
                                .scaledToFit()
                                .clipShape(.circle)
                                .overlay(
                                    Circle()
                                        .stroke(.white, lineWidth: 1)
                                )
                                .onTapGesture {
                                    selectedAnimal = animal.id
                                }
                        }
                    }//: Grid
                    .onAppear(perform: {
                        gridSwitch()
                    })
                }//: Vstack
            }//: Scroll
            .frame(maxWidth: .infinity, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
//            .background(MotionAnimationView())
        }
    }
}

#Preview {
    GalleryView()
}
