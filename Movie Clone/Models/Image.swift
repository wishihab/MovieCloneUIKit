//
//  Image.swift
//  Movie Clone
//
//  Created by Alwi Shihab on 24/09/22.
//

import Foundation

struct ImagesResponse: Codable{
    let profiles: [Profile]
}

struct Profile: Codable{
    let height: Int
    let file_path: String?
    let width: Int
}
