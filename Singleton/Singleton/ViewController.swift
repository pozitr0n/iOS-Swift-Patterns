//
//  ViewController.swift
//  Singleton
//
//  Created by Raman Kozar on 01/10/2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(Settings.shared.volumeLevel)
        
        Settings.shared.volumeLevel = 3.0
        
        print(Settings.shared.volumeLevel)
        
    }

}

