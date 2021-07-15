//
//  VideoListView.swift
//  Africa
//
//  Created by Victor Monteiro on 5/30/21.
//

import SwiftUI

struct VideoListView: View {
    
    @State private var videos: [Video] = Bundle.main.decode("videos.json")
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    var body: some View {
        
        NavigationView {
            
            List {
                
                ForEach(videos){ video in
                    
                    NavigationLink(destination: VideoPlayerView(videoSelected: video.id,
                                                                videoTitle: video.name)) {
                        VideoListItemView(video: video)
                            .padding(.vertical, 8)
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Videos", displayMode: .inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                      //Shuffle Vides
                        videos.shuffle()
                        hapticImpact.impactOccurred()
                    }) {
                        Image(systemName: "arrow.2.squarepath")
                    }
                }
            }
            
        }//: NAVIGATION
    }
}

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}

//HAPTICS
// let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
