//
//  CodableBundleExtension.swift
//  AfricaApp
//
//  Created by Ramachandran Varadaraju on 02/07/24.
//

import Foundation

extension Bundle{
    func decode<T: Decodable>(_ fileName: String) -> T{
        // Locate the json file
        guard let url = self.url(forResource: fileName, withExtension: nil) else {
            fatalError("Failed to locate \(fileName) in the bundle")
        }
        
        // Create a property for data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(fileName) from bundle")
        }
        
        // Create a decoder
        let decoder = JSONDecoder()
        
        // Create a proper for decoded data
        guard let decoded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(fileName) in the bundle")
        }
        
        // return ready to use data
        return decoded
    }
}
