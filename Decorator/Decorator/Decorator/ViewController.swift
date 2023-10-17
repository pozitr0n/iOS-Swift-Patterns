//
//  ViewController.swift
//  Decorator
//
//  Created by Raman Kozar on 17/10/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var price: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel! {
        didSet {
            priceLabel.text = String(chevrolet.getPrice()) + "$"
        }
    }
    
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    var chevrolet: ChevroletProtocol = ChevroletLS()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chevrolet = ChevroletLS()
        contentLabel.text = chevrolet.getTitle() + " LS"
        priceLabel.text = String(chevrolet.getPrice()) + "$"
        
    }

    @IBAction func menuCarSegment(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            
            chevrolet = ChevroletLS()
            contentLabel.text = chevrolet.getTitle() + " LS"
            priceLabel.text = String(chevrolet.getPrice()) + "$"
            
        case 1:
            
            chevrolet = ChevroletLS()
            chevrolet = Panorama(decoratorType: chevrolet)
            
            contentLabel.text = chevrolet.getTitle()
            priceLabel.text = String(chevrolet.getPrice()) + "$"
            
        case 2:
            
            chevrolet = ChevroletLS()
            chevrolet = AlloyWheels(decoratorType: chevrolet)
            
            contentLabel.text = chevrolet.getTitle()
            priceLabel.text = String(chevrolet.getPrice()) + "$"
            
        default: 
            break
        }
        
    }
    
}

