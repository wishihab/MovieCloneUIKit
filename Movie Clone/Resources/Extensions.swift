//
//  Extensions.swift
//  Movie Clone
//
//  Created by Alwi Shihab on 24/09/22.
//

import Foundation

//extensions is like utils android?
extension String{
    
    func capitalizeFirstLetter() -> String{
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
