//
//  ViewController.swift
//  Bridge
//
//  Created by Raman Kozar on 29/10/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityName: UITextField!
    @IBOutlet weak var dayPicker: DayPickerView!
    @IBOutlet weak var temperatureLogo: UIImageView!
    
    var days = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    var currentIndex: Int = 0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        cityName.text = "Poznań"
        
        dayPicker.dataSource = self
        dayPicker.delegate = self
        dayPicker.setStartDate()
        
        cityName.addTarget(self, action: #selector(textChanged), for: .editingDidEnd)
    
    }

    @objc func textChanged(_ textField: UITextField) {
        updateMainViewController(currentIndex)
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

extension ViewController: DayPickerViewDelegate {
    
    func updateMainViewController(_ index: Int) {
        
        guard let city = cityName.text else {
            return
        }
        
        if city.isEmpty {
            return
        }
        
        currentIndex = index
        
        OpenWeatherAPI().getTemperatureByDay(day: index, city: city, completion: { (data) in
            
            DispatchQueue.main.async {
                if data.count != 0 {
                    self.temperatureLabel.text = data[0]
                    self.temperatureLogo.image = UIImage(named: data[1])
                }
            }
            
        })
    
    }

}

extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}
