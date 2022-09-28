//
//  Region.swift
//  Movie Clone
//
//  Created by Alwi Shihab on 27/09/22.
//

import Foundation

struct MovieResponse: Codable{
    let results: [Movie]
}


struct Movie: Codable{
    let id: Int
    let original_title: String?
    let overview: String?
    let title: String?
}

