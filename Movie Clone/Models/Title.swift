//
//  Movie.swift
//  Movie Clone
//
//  Created by Alwi Shihab on 24/09/22.
//

import Foundation

struct CastTitleResponse: Codable{
    let cast: [Title]
    let crew: [Crew]
}

struct Title: Codable{
    let id: Int
    let original_title: String?
    let overview: String?
    let poster_path: String?
    let backdrop_path: String?
}

struct Crew: Codable{
    let id: Int
    let original_title: String?
    let overview: String?
    let poster_path: String
}

