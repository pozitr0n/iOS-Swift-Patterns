//
//  ViewController.swift
//  Visitor
//
//  Created by Raman Kozar on 09/11/2023.
//

import UIKit

class FirstCell: UITableViewCell { /**/ }
class SecondCell: UITableViewCell { /**/ }
class ThirdCell: UITableViewCell { /**/ }

struct HeightResultVisitor {
 
    func visit(_ cell: FirstCell) -> CGFloat { return 10.0 }
    func visit(_ cell: SecondCell) -> CGFloat { return 30.0 }
    func visit(_ cell: ThirdCell) -> CGFloat { return 50.0 }
    
}

protocol HeightResultVisitable {
    func accept(_ visitor: HeightResultVisitor) -> CGFloat
}

extension FirstCell: HeightResultVisitable {
    func accept(_ visitor: HeightResultVisitor) -> CGFloat {
        return visitor.visit(self)
    }
}

extension SecondCell: HeightResultVisitable {
    func accept(_ visitor: HeightResultVisitor) -> CGFloat {
        return visitor.visit(self)
    }
}

extension ThirdCell: HeightResultVisitable {
    func accept(_ visitor: HeightResultVisitor) -> CGFloat {
        return visitor.visit(self)
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        registerCell()
        
    }

    func registerCell() {
        tableView.register(FirstCell.self, forCellReuseIdentifier: "FirstCell")
        tableView.register(SecondCell.self, forCellReuseIdentifier: "SecondCell")
        tableView.register(ThirdCell.self, forCellReuseIdentifier: "ThirdCell")
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let firstCell = tableView.dequeueReusableCell(withIdentifier: "FirstCell") as? FirstCell else {
            return UITableViewCell()
        }
        
        guard let secondCell = tableView.dequeueReusableCell(withIdentifier: "SecondCell") as? SecondCell else {
            return UITableViewCell()
        }
        
        guard let thirdCell = tableView.dequeueReusableCell(withIdentifier: "ThirdCell") as? ThirdCell else {
            return UITableViewCell()
        }
        
        if indexPath.row == 0 {
            return firstCell
        } else if indexPath.row == 1 {
            return secondCell
        } else if indexPath.row == 2 {
            return thirdCell
        }
        
        return UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let cell = tableView.cellForRow(at: indexPath) as! HeightResultVisitable
        return cell.accept(HeightResultVisitor())
    
    }
    
}

