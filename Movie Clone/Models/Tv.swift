//
//  Tv.swift
//  Movie Clone
//
//  Created by Alwi Shihab on 24/09/22.
//

import Foundation

struct TvCreditsResponse: Codable{
    let cast: [TvCast]
    let crew: [TvCrew]
}

struct TvCast: Codable{
    let id: Int
    let original_name: String?
    let overview: String?
    let poster_path: String?
    let first_air_date: String?
    let character: String?
}

struct TvCrew: Codable{
    let id: Int
    let original_title: String?
    let overview: String?
    let poster_path: String?
    let release_date: String?
}
