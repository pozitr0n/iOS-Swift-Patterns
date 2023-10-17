//
//  ChevroletDecorator.swift
//  Decorator
//
//  Created by Raman Kozar on 17/10/2023.
//

import Foundation

class ChevroletDecorator: ChevroletProtocol {
    
    // added adapter
    private let decoratorType: ChevroletProtocol
    
    required init(decoratorType: ChevroletProtocol) {
        self.decoratorType = decoratorType
    }
    
    func getTitle() -> String {
        return decoratorType.getTitle()
    }
    
    func getPrice() -> Double {
        return decoratorType.getPrice()
    }
    
}
