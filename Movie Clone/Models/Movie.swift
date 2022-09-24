//
//  Movie.swift
//  Movie Clone
//
//  Created by Alwi Shihab on 24/09/22.
//

import Foundation

struct MovieCreditsResponse: Codable{
    let cast: [Cast]
    let crew: [Crew]
}

struct Cast: Codable{
    let id: Int
    let original_title: String?
    let overview: String?
    let poster_path: String?
    let release_date: String?
    let character: String?
}

struct Crew: Codable{
    let id: Int
    let original_title: String?
    let overview: String?
    let poster_path: String?
    let release_date: String?
}

