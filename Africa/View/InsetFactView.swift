//
//  InsetFactView.swift
//  Africa
//
//  Created by Victor Monteiro on 6/14/21.
//

import SwiftUI

struct InsetFactView: View {
   
    var animal: Animal
    
    var body: some View {
        
        GroupBox {
            
            TabView {
                
                ForEach(animal.fact, id: \.self){ facts in
                    Text(facts)
                }//: LOOP
                
            }//: TABVIEW
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
           
        }//: BOX
        
    }
}

struct InsetFactView_Previews: PreviewProvider {
    static var animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        InsetFactView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
