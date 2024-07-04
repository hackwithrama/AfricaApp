//
//  LocationModel.swift
//  AfricaApp
//
//  Created by Ramachandran Varadaraju on 03/07/24.
//

import Foundation
import SwiftUI
import MapKit

struct NationalParkLocation : Identifiable, Codable{
    let id: String
    let name: String
    let image: String
    let latitude: Double
    let longitude: Double
    
    var locationCoordinate: CLLocationCoordinate2D{
        CLLocationCoordinate2D(
            latitude: latitude,
            longitude: longitude
        )
    }
}
