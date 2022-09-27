//
//  Region.swift
//  Movie Clone
//
//  Created by Alwi Shihab on 27/09/22.
//

import Foundation

struct RegionResponse: Codable{
    let results: [Region]
}


struct Region: Codable{
    let iso_3166_1: String?
    let english_name: String?
    let native_name: String?
}
