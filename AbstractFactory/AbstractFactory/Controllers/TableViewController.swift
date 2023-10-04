//
//  TableViewController.swift
//  AbstractFactory
//
//  Created by Raman Kozar on 03/10/2023.
//

import UIKit

class TableViewController: UITableViewController {

    var mainDictionary: [String:String]?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "CellID")
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let mainDictionary = mainDictionary else {
            return 0
        }
        
        return mainDictionary.count
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath) as! TableViewCell
        
        if let mainDictionary = mainDictionary {
            cell.fillTheEquals(picName: Array(mainDictionary.values)[indexPath.row], labelName: Array(mainDictionary.keys)[indexPath.row])
        }
        
        return cell
        
    }
    
}
