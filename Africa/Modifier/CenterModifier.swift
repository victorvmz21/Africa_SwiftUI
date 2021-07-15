//
//  CenterModifier.swift
//  Africa
//
//  Created by Victor Monteiro on 6/20/21.
//

import SwiftUI

//MARK: THIS IS A CUSTOM MODIFIER
//MODIFIER ALWAS NEED TO BE CREATED INSIDE THE BODY FUNCTION

struct CenterModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }

}
