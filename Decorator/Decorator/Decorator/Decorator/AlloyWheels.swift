//
//  AlloyWheels.swift
//  Decorator
//
//  Created by Raman Kozar on 17/10/2023.
//

import Foundation

class AlloyWheels: ChevroletDecorator {
    
    required init(decoratorType: ChevroletProtocol) {
        super.init(decoratorType: decoratorType)
    }
    
    override func getTitle() -> String {
        return super.getTitle() + " Premium"
    }
    
    override func getPrice() -> Double {
        return super.getPrice() + 5000
    }
    
}
