//
//  MotionAnimationView.swift
//  Africa
//
//  Created by Victor Monteiro on 6/18/21.
//

import SwiftUI

struct MotionAnimationView: View {
    
    @State private var randomCircle = Int.random(in: 12...16)
    @State private var isAnimating: Bool = false
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack {
                
                ForEach(0...randomCircle, id: \.self) { item in
                    
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.15)
                        .frame(width: randomSize(), height: randomSize(), alignment: .center)
                        .scaleEffect(isAnimating ? randomScale() : 1)
                        .position(
                            x: randomCoordinates(max: geometry.size.width),
                            y: randomCoordinates(max: geometry.size.height)
                    )
                        .animation(
                            Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                                .repeatForever()
                                .speed(randomSpeed())
                                .delay(randomDelay())
                        )
                        .onAppear(perform: {
                            isAnimating = true
                        })
                    
                }//: LOOP
                
            }//:ZSTACK
            .drawingGroup()
            
            
        }//: GEOMETRY
    }
    
    //FUNCTIONS
    
    //1- RANDOM COORDINATES
    func randomCoordinates(max: CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max)
    }
    //2- RANDOM SIZE
    func randomSize() -> CGFloat {
        return CGFloat(Int.random(in: 10...300))
    }
    //3- RANDOM SCALE
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    //4- RANDOM SPEED
    func randomSpeed() -> Double {
        return Double.random(in: 0.025...1.0)
    }
    //5- RANDOM DELAY
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
}

struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
    }
}

//Geometry reader we can measure any view size as we wish, we can access size and position of parent view
