//
//  ViewController.swift
//  Bridge
//
//  Created by Raman Kozar on 29/10/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dayPicker: DayPickerView!
    
    var days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dayPicker.dataSource = self
    }

}

extension ViewController: DayPickerViewDataSource {
    
    func dayPickerCount(_ dayPicker: DayPickerView) -> Int {
        return days.count
    }
    
    func dayPickerTitle(_ dayPicker: DayPickerView, indexPath: IndexPath) -> String {
        return days[indexPath.row]
    }

}
