//
//  FactoryExcercises.swift
//  FactoryMethod
//
//  Created by Raman Kozar on 02/10/2023.
//

import Foundation

enum Excercises {
    
    case jumping
    case squarts
    
}

class FactoryExcercises {
    
    static let defaultFactory = FactoryExcercises()
    
    func createExcercise(name: Excercises) -> Excercise {
    
        switch name {
        case .jumping:
            return Jumping()
        case .squarts:
            return Squarts()
        }
        
    }
    
}
