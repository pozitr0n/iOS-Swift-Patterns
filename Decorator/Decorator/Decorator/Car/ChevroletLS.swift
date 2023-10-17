//
//  ChevroletLS.swift
//  Decorator
//
//  Created by Raman Kozar on 17/10/2023.
//

import Foundation

class ChevroletLS: ChevroletProtocol {
    
    func getTitle() -> String {
        return "Chevrolet Malibu"
    }
    
    func getPrice() -> Double {
        return 11000
    }
    
}
