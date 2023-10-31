//
//  ViewController.swift
//  Flyweight
//
//  Created by Raman Kozar on 31/10/2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let red: UIColor = .red
        let red2: UIColor = .red
        
        print(red === red2)
        
        //
        
        let color = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        let color2 = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        
        print(color === color2)
        
        //
        
        let flyColor = UIColor.rgba(1, 0, 0, 1)
        let flyColor2 = UIColor.rgba(1, 0, 0, 1)
        
        print(flyColor === flyColor2)
        
    }

}

extension UIColor {
    
    static var colorStore: [String: UIColor] = [:]
    
    class func rgba(_ red: CGFloat, 
                    _ green: CGFloat,
                    _ blue: CGFloat,
                    _ alpha: CGFloat) -> UIColor {
    
        let key: String = "\(red)\(green)\(blue)\(alpha)"
        
        if let color = colorStore[key] {
            return color
        }
        
        let color = UIColor(red: red,
                            green: green,
                            blue: blue,
                            alpha: alpha)
        
        colorStore[key] = color
        return color
        
    }
    
}

