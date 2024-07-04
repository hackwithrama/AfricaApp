//
//  InsetMapView.swift
//  AfricaApp
//
//  Created by Ramachandran Varadaraju on 03/07/24.
//

import SwiftUI
import MapKit

struct InsetMapView: View {
    // MARK: PROPERTIES
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 6.600286,
            longitude: 16.4377599
        ),
        span: MKCoordinateSpan(
            latitudeDelta: 60.0,
            longitudeDelta: 60.0
        )
    )
    
    var body: some View {
            Map(position: .constant(.region(region)))
                .overlay(
                    NavigationLink{
                        MapView()
                    }label: {
                        HStack{
                            Image(systemName: "mappin.circle")
                                .imageScale(.large)
                                .foregroundColor(.white)
                            Text("Locations")
                                .foregroundColor(.accentColor)
                                .fontWeight(.bold)
                                
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal, 15)
                        .background(.ultraThinMaterial)
                        .cornerRadius(8)
                    }, alignment: .topTrailing
            )
    }
}

#Preview {
    InsetMapView()
}
