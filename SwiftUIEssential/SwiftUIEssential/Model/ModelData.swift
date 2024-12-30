//
//  ModelData.swift
//  SwiftUIEssential
//
//  Created by Timmy Lau on 2024-12-16.
//

import Foundation


@Observable
class ModelData{
    var landmarks:[Landmark] = load("landmarkData.json")
    
}


//fetch JSON data from Resources

func load<T:Decodable>(_ filename: String) -> T {
    
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else{
        fatalError("Could not load \(filename) from main bundle")
    }
    
    do{
        data = try Data(contentsOf: file)
    }catch{
        fatalError("Could not load \(filename) from main bundle: \n\(error)")
    }
    
    do{
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch{
        fatalError("Could parse \(filename) as \(T.self): \n\(error)")
    }
}
