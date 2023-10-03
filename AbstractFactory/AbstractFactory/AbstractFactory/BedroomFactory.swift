//
//  BedroomFactory.swift
//  AbstractFactory
//
//  Created by Raman Kozar on 03/10/2023.
//

import Foundation

class BedroomFactory: AbstractFactory {
    
    func createChair() -> Chair {
        print("Created chair for bedroom")
        return ChairBedroom()
    }
    
    func createSofa() -> Sofa {
        print("Created sofa for bedroom")
        return SofaBedroom()
    }
    
    func createTable() -> Table {
        print("Created coffee table for bedroom")
        return CoffeeTableBedroom()
    }
    
}
