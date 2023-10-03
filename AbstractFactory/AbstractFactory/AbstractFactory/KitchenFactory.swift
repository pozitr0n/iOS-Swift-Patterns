//
//  KitchenFactory.swift
//  AbstractFactory
//
//  Created by Raman Kozar on 03/10/2023.
//

import Foundation

class KitchenFactory: AbstractFactory {
    
    func createChair() -> Chair {
        print("Created chair for kitchen")
        return ChairKitchen()
    }
    
    func createSofa() -> Sofa {
        print("Created sofa for kitchen")
        return SofaKitchen()
    }
    
    func createTable() -> Table {
        print("Created coffee table for kitchen")
        return TableKitchen()
    }
    
}
