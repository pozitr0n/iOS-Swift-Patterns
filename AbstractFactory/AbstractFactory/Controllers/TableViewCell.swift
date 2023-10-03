//
//  TableViewCell.swift
//  AbstractFactory
//
//  Created by Raman Kozar on 03/10/2023.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func fillTheEquals(picName: String, labelName: String) {
   
        myImageView.image = UIImage(named: picName)
        myLabel.text = labelName
        
    }
    
}
