//
//  AbstractFactory.swift
//  AbstractFactory
//
//  Created by Raman Kozar on 03/10/2023.
//

import Foundation

// Full abstraction using abstract factory
//
protocol AbstractFactory {
    
    func createChair() -> Chair
    func createSofa() -> Sofa
    func createTable() -> Table
    
}
