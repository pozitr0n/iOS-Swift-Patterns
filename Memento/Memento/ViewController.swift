//
//  ViewController.swift
//  Memento
//
//  Created by Raman Kozar on 08/11/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewBoard: DrawView!
    
    var carrierState: CarrierState!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewBoard.lineColor = UIColor.black
        
        let lines = LinesManager.shared
        carrierState = CarrierState(linesManager: lines)

    }

    @IBAction func saveAction(_ sender: Any) {
        carrierState.saveLine()
    }
    
    @IBAction func loadAction(_ sender: Any) {
        carrierState.loadLine()
        carrierState.linesManager.printLines(in: viewBoard)
    }
    
    @IBAction func blueColourAction(_ sender: Any) {
        viewBoard.lineColor = UIColor.blue
    }
    
    @IBAction func orangeColorAction(_ sender: Any) {
        viewBoard.lineColor = UIColor.orange
    }
    
    @IBAction func greenColorAction(_ sender: Any) {
        viewBoard.lineColor = UIColor.green
    }
    
}

