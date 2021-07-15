//
//  CreditsView.swift
//  Africa
//
//  Created by Victor Monteiro on 6/19/21.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack(alignment:.center) {
            
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
            
            Text("""
                Copyright © Victor Monteiro
                All right reserved
                """)
                .font(.footnote)
                .multilineTextAlignment(.center)
            
        }//: VSTACK
        .padding()
        .opacity(0.4)
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
