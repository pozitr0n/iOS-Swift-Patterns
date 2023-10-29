//
//  ViewController.swift
//  Builder
//
//  Created by Raman Kozar on 29/10/2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func catalogButtonTapped(_ sender: Any) {
        
        let controller = CatalogBuilder().setTitle("Catalon no. 1").build()
        self.present(controller, animated: true, completion: nil)
        
    }
    
}

