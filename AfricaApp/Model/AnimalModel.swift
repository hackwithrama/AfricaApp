//
//  AnimalModel.swift
//  AfricaApp
//
//  Created by Ramachandran Varadaraju on 02/07/24.
//

import SwiftUI

struct Animal: Identifiable, Codable{
    let id: String
    let name: String
    let headline: String
    let description: String
    let link: String
    let image: String
    let gallery: [String]
    let fact: [String]
}
 
