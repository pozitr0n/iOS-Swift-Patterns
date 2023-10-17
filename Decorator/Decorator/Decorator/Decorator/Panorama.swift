//
//  Panorama.swift
//  Decorator
//
//  Created by Raman Kozar on 17/10/2023.
//

import Foundation

class Panorama: ChevroletDecorator {
    
    required init(decoratorType: ChevroletProtocol) {
        super.init(decoratorType: decoratorType)
    }
    
    override func getTitle() -> String {
        return super.getTitle() + " LT"
    }
    
    override func getPrice() -> Double {
        return super.getPrice() + 1000
    }
    
}
