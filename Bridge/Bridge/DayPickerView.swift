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

class DayPickerView: UIControl {
    
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
        
        // API weather!
        
    }
    
}
