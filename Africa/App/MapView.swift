//
//  MapView.swift
//  Africa
//
//  Created by Victor Monteiro on 5/30/21.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State private var region: MKCoordinateRegion = {
        
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        
        return mapRegion
    }()
    
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    var body: some View {
//        Map(coordinateRegion: $region)
//            .ignoresSafeArea(.all)
        Map(coordinateRegion: $region, annotationItems: locations, annotationContent: { item in
            //ADDING PIN
            
            //OPTION A OLD STYLE (always static)
            //MapPin(coordinate: item.location, tint: .accentColor)
            
            //OPTION B NEW STYLE (always static)
            //MapMarker(coordinate: item.location, tint: .accentColor)
                
            
            ///To have users interaction we need a custom annotation
            //(C) CUSTOM BASIC ANNOTATION (it could be interactive)
//            MapAnnotation(coordinate: item.location) {
//
//            }
            
            //CUSTOM ADVANCED ANNOTATION (it could be interacticve)
            MapAnnotation(coordinate: item.location) {
                MapAnnotationView(location: item)
            }
            
        })//: MAP
        
        .overlay(
        
            HStack(alignment: .center, spacing: 12) {
                
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 38, alignment: .center)
                
                VStack(alignment: .leading, spacing: 3) {
                   
                    HStack {
                        
                        Text("Latitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        
                        Spacer()
                        
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                    
                    HStack {
                        
                        Text("Longitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        
                        Spacer()
                        
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                    
                }
                
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(
                Color.black
                    .cornerRadius(8)
                    .opacity(0.6)
            )
            .padding(), alignment: .top
        
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
