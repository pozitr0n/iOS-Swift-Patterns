//
//  LinesManager.swift
//  Memento
//
//  Created by Raman Kozar on 08/11/2023.
//

import Foundation
import UIKit

class LinesManager {
    
    // Singleton pattern
    static let shared = LinesManager()
    
    var linesArray = [LineModel]()
    
    // Creating StateLinesMemento object
    func save() -> StateLinesMemento {
        return StateLinesMemento(linesArraySaved: self.linesArray)
    }
    
    // Loading lines
    func load(state: StateLinesMemento) {
        self.linesArray = state.linesArraySaved
    }
    
    func printLines(in view: UIView) {
       
        guard let sublayers = view.layer.sublayers else {
            return
        }
        
        // Deleting all the lines, because we have another lines
        for currentView in sublayers {
            currentView.removeFromSuperlayer()
        }
        
        for currentLine in linesArray {
            
            let path = UIBezierPath()
            path.move(to: currentLine.startLine)
            path.addLine(to: currentLine.endLine)
            
            drawShapeLayer(path, currentLine.color, view)
            
        }
        
    }
    
    // Drawing lines
    private func drawShapeLayer(_ path: UIBezierPath, _ lineColor: UIColor, _ view: UIView) {
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = lineColor.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.fillColor = UIColor.clear.cgColor
        
        view.layer.addSublayer(shapeLayer)
        
        // Forces the view to be redrawn
        view.setNeedsDisplay()
        
    }
    
}
