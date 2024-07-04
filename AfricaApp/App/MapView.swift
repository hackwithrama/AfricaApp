//
//  MapView.swift
//  AfricaApp
//
//  Created by Ramachandran Varadaraju on 02/07/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599), span: MKCoordinateSpan(latitudeDelta: 65.0, longitudeDelta: 65.0))
    
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    var body: some View {
//        Map(position: .constant(.region(region)))
        Map(coordinateRegion: $region, annotationItems: locations, annotationContent: {item in
            MapAnnotation(coordinate: item.locationCoordinate) {
                Image("map-\(item.id)")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .clipShape(.circle)
            }
        })
    }
}

#Preview {
    MapView()
}
