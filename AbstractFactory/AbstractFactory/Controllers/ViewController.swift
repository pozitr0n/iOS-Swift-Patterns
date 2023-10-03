//
//  ViewController.swift
//  AbstractFactory
//
//  Created by Raman Kozar on 03/10/2023.
//

import UIKit

class ViewController: UIViewController {

    var chair: Chair?
    var table: Table?
    var sofa: Sofa?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func orderForKitchen(_ sender: Any) {
        
        var kitchenDictionary = [String:String]()
        
        chair = KitchenFactory().createChair()
        kitchenDictionary[chair!.name] = chair?.image
        
        table = KitchenFactory().createTable()
        kitchenDictionary[table!.name] = table?.image
        
        sofa  = KitchenFactory().createSofa()
        kitchenDictionary[sofa!.name] = sofa?.image
        
        let tableVC = storyboard?.instantiateViewController(withIdentifier: "MainTableViewController") as! TableViewController
        tableVC.mainDictionary = kitchenDictionary
        
        self.present(tableVC, animated: true)
        
    }
    
    @IBAction func orderForRoom(_ sender: Any) {
        
        var roomDictionary = [String:String]()
        
        chair = BedroomFactory().createChair()
        roomDictionary[chair!.name] = chair?.image
        
        table = BedroomFactory().createTable()
        roomDictionary[table!.name] = table?.image
        
        sofa  = BedroomFactory().createSofa()
        roomDictionary[sofa!.name] = sofa?.image
        
        let tableVC = storyboard?.instantiateViewController(withIdentifier: "MainTableViewController") as! TableViewController
        tableVC.mainDictionary = roomDictionary
        
        self.present(tableVC, animated: true)
        
    }
    
}

