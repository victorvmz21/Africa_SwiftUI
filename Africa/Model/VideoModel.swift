//
//  VideoModel.swift
//  Africa
//
//  Created by Victor Monteiro on 6/16/21.
//

import Foundation

struct Video: Codable, Identifiable {
    
    let id: String
    let name: String
    let headline: String
    
    //Computed Property
    var thumbnail: String {
        "video-\(id)"
    }
    
}
