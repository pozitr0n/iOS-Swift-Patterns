//
//  LineModel.swift
//  Memento
//
//  Created by Raman Kozar on 08/11/2023.
//

import Foundation
import UIKit

struct LineModel {
    
    var startLine: CGPoint
    var endLine: CGPoint
    var color: UIColor
    
    init(startLine: CGPoint, endLine: CGPoint, color: UIColor) {
        self.startLine = startLine
        self.endLine = endLine
        self.color = color
    }
    
}
