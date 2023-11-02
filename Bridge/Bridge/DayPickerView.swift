//
//  DayPicker.swift
//  Bridge
//
//  Created by Raman Kozar on 29/10/2023.
//

import Foundation
import UIKit

protocol DayPickerViewDataSource {
    func dayPickerCount(_ dayPicker: DayPickerView) -> Int
    func dayPickerTitle(_ dayPicker: DayPickerView, indexPath: IndexPath) -> String
}

protocol DayPickerViewDelegate {
    func updateMainViewController(_ index: Int)
}

class DayPickerView: UIControl {
    
    let condition: [Int:Int] = [1:0, 2:1, 3:2, 4:3, 5:4, 6:5, 7:6]
    
    var delegate: DayPickerViewDelegate?
    var dataSource: DayPickerViewDataSource? {
        
        didSet {
            setupView() // when ONLY created dataSource and had data
        }
        
    }
        
    private var buttons: [UIButton] = []
    private var stackView: UIStackView!
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        stackView.frame = bounds
        
    }
    
    func setupView() {
        
        let count = dataSource?.dayPickerCount(self)
        
        guard let count = count else {
            return
        }
        
        for item in 0..<count {
            
            let indexPath = IndexPath(row: item, section: 0)
            let title = dataSource?.dayPickerTitle(self, indexPath: indexPath)
            let button = UIButton(type: .system)
            
            button.setTitle(title, for: .normal)
            button.tag = item
            button.setTitleColor(.lightGray, for: .normal)
            button.setTitleColor(.white, for: .selected)
            
            button.addTarget(self, action: #selector(selectedButton), for: .touchUpInside)
            
            buttons.append(button)
            
            self.addSubview(button)
            
        }
        
        stackView = UIStackView(arrangedSubviews: self.buttons)
        self.addSubview(stackView)
        
        stackView.spacing = 8
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        
    }
    
    @objc func selectedButton(sender: UIButton) {
        
        for button in buttons {
            button.isSelected = false
        }
        
        let index = sender.tag
        let button = self.buttons[index]
        
        button.isSelected = true
        
        delegate?.updateMainViewController(index)
        
    }
    
    func setStartDate() {
        
        let calendar = Date()
        let dayOfTheWeek = calendar.dayNumberOfWeek()
        
        guard let dayOfTheWeekUnwr = dayOfTheWeek else {
            return
        }
        
        for button in buttons {
            button.isSelected = false
        }
        
        let button = self.buttons[condition[dayOfTheWeekUnwr]!]
        button.isSelected = true
        
        delegate?.updateMainViewController(condition[dayOfTheWeekUnwr]!)
        
    }
    
}
