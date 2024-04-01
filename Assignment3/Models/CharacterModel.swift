//
//  CharacterModel.swift
//  Assignment3
//
//  Created by Blaire Grant on 3/31/24.
//

import Foundation

struct CharacterResults : Codable {
    let data : [CharacterModel]
}

struct CharacterModel : Codable, Identifiable {
    var id : UUID {
        return UUID()
    }
    let sourceUrl: String
    let name: String
    let imageUrl: String?
    //var films: [String]? = [""]
}
