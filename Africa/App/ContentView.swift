//
//  ContentView.swift
//  Africa
//
//  Created by Victor Monteiro on 5/30/21.
//

import SwiftUI

struct ContentView: View {
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var isGridViewActivate: Bool = false
    
    @State private var gridLayout: [GridItem] = [ GridItem(.flexible()) ]
    @State private var gridColum: Int = 1
    @State private var toolBarIcon: String = "square.grid.2x2"
    
    var body: some View {
        
        NavigationView {
            
            Group {
                
                if !isGridViewActivate {
                    
                    List {
                        
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                            .padding(.bottom, 16)
                        
                        ForEach(animals) { animal in
                            NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                AnimalListView(animal: animal)
                            }
                            
                        }//: LOOP
                        
                        CreditsView()
                            .modifier(CenterModifier())
                           
                        
                    }//: LIST
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                    AnimalGridItemView(animal: animal)
                                }//: LINK
                            }//: LOOP
                        }//: GRID
                        .padding(10)
                        .animation(.easeIn)
                        
                    }
                    
                }//: CONDITION
                
            }//: GROUP
            
            .navigationBarTitle("Africa")
            .toolbar {
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    HStack {
                        
                      //LIST
                        Button(action: {
                            print("List view is activated")
                            isGridViewActivate = false
                            haptics.impactOccurred()
                        }, label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActivate ? .primary : .accentColor)
                        })
                        
                        //GRID
                        Button(action: {
                            print("Grid view is activate")
                            isGridViewActivate = true
                            haptics.impactOccurred()
                            gridSwitch()
                        }, label: {
                            Image(systemName: toolBarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActivate ? .accentColor : .primary)
                        })
                        
                    }//: HSTACK
                     
                }//: BUTTONS
                
            }//: TOOLBAR
            
        }//NAVIGATION
    }
    
    func gridSwitch() {
        gridLayout = Array(repeating: GridItem(.flexible()), count: gridLayout.count % 3 + 1 )
        gridColum = gridLayout.count
        print("Grid Number: \(gridColum)")
        
        switch gridColum {
        case 1:
            toolBarIcon = "square.grid.2x2"
        case 2:
            toolBarIcon = "square.grid.3x2"
        case 3:
            toolBarIcon = "rectangle.grid.1x2"
        default:
            toolBarIcon = "square.grid.2x2"
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
