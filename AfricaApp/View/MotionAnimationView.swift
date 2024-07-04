//
//  MotionAnimationView.swift
//  AfricaApp
//
//  Created by Ramachandran Varadaraju on 04/07/24.
//

import SwiftUI

struct MotionAnimationView: View {
    @State private var randomCircle = Int.random(in: 12...16)
    @State private var isAnimating = false
    
    // MARK: FUNCTION
    // 1. Random Coordinates
    func randomCoordinates() -> CGFloat{
        return CGFloat.random(in: 0...256)
    }
    
    // 2. Random Size
    func randomSize() -> CGFloat{
        return CGFloat(Int.random(in: 30...150))
    }
    
    // 3. Random Scale
    func randomScale() -> CGFloat{
        return CGFloat(Double.random(in: 0.1...3.0))
    }
    
    // 4. Random Speed
    func randomSpeed() -> Double{
        return Double.random(in: 0.5...1.0)
    }
    
    // 5. Random Delay
    func randomDelay() -> Double{
        return Double.random(in: 0.5...1.0)
    }
    
    var body: some View {
        ZStack{
            ForEach(0..<randomCircle, id: \.self){item in
                Circle()
                    .fill(.white)
                    .opacity(0.25)
                    .frame(width: randomSize(), height: randomSize(), alignment: .center)
                    .position(
                        x: randomCoordinates(),
                        y: randomCoordinates()
                    )
                    .scaleEffect(isAnimating ? randomScale() : 1.0)
                    .onAppear(perform: {
                        withAnimation(
                            .interpolatingSpring(
                                stiffness: 0.5,
                                damping: 0.5
                            )
                            .repeatForever()
                            .speed(randomSpeed())
                            .delay(randomDelay())
                        ){
                            isAnimating = true
                        }
                    })
                    
            }
        }
        .frame(width: 256, height: 256)
    }
}

#Preview {
    MotionAnimationView()
}
