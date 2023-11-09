//
//  CarrierState.swift
//  Memento
//
//  Created by Raman Kozar on 09/11/2023.
//

import Foundation

class CarrierState {
    
    var state: StateLinesMemento?
    var linesManager: LinesManager
    
    init(linesManager: LinesManager) {
        self.linesManager = linesManager
    }
    
    public func saveLine() {
        state = linesManager.save()
    }
    
    func loadLine() {
        
        guard state != nil else { return }
        guard let stateUnwr = state else { return }
        
        linesManager.load(state: stateUnwr)
        
    }
    
}
