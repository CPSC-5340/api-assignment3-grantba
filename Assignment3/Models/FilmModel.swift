//
//  FilmModel.swift
//  Assignment3
//
//  Created by Blaire Grant on 3/31/24.
//

import Foundation

struct FilmModel : Codable, Identifiable {
    var id = UUID()
    let films : String?
}
