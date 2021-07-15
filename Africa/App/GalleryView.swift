//
//  GalleryView.swift
//  Africa
//
//  Created by Victor Monteiro on 5/30/21.
//

import SwiftUI

struct GalleryView: View {
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    @State private var selectedAnimal: String = "lion"
    let hapticFeedBack = UIImpactFeedbackGenerator(style: .medium)
    
    //Simple Grid Definition
    //    let gridLayout: [GridItem] = [
    //        GridItem(.flexible()),
    //        GridItem(.flexible()),
    //        GridItem(.flexible())
    //    ]
    
    //EFFICIENT GRID
    //let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    //Dynamic grid Layout
    @State private var gridLayout = [GridItem(.flexible())]
    @State private var gridColum = 3.0
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            //MARK: GRID
            VStack(alignment: .center, spacing: 30) {
                
             //MARK: IMAGE
                VStack(alignment: .center, spacing: 10) {
                    
                    Image(selectedAnimal)
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 8))
                    
                    Text(selectedAnimal.uppercased())
                        .font(.title)
                        .fontWeight(.heavy)
                    
                }//:VSTACK
                
            //MARK: Slider
                
                Slider(value: $gridColum, in: 2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColum, perform: { value in
                        hapticFeedBack.impactOccurred()
                        gridSwitch()
                    })
                
                
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 4))
                            .onTapGesture {
                                selectedAnimal = item.image
                                hapticFeedBack.impactOccurred()
                            }
                    }//: LOOP
                    
                }//: GRID
                .animation(.easeIn)
                .onAppear(perform: {
                    gridSwitch()
                })
                
            }//: VSTACK
            .padding(.horizontal, 10)
            .padding(.vertical, 16)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            MotionAnimationView()
        )
        
    }
    
    func gridSwitch() {
        gridLayout = Array(repeating: GridItem(.flexible()), count: Int(gridColum))
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
