//
//  Settings.swift
//  Singleton
//
//  Created by Raman Kozar on 01/10/2023.
//

import Foundation
import UIKit

class Settings {
    
    // Creating Singleton
    static let shared = Settings()
    
    var colorStyle: UIColor = .white
    var volumeLevel: Float = 1.0
    
    private init() {}
    
}
