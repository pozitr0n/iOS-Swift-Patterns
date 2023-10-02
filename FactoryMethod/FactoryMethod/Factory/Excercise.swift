//
//  Excercise.swift
//  FactoryMethod
//
//  Created by Raman Kozar on 02/10/2023.
//

import Foundation

// Abstraction
protocol Excercise {
    
    var name: String { get }
    var type: String { get }

    func start()
    func stop()
    
}
