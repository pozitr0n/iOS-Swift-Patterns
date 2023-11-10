//
//  ViewController.swift
//  Observer
//
//  Created by Raman Kozar on 09/11/2023.
//

import UIKit

protocol Observer: AnyObject {
    func update(subject: NotificationCenters)
}

class NotificationCenters {
    
    var state: Int = {
        return Int(arc4random_uniform(10))
    }()
    
    private lazy var observers = [Observer]()

    func subscribe(_ observer: Observer) {
        print(#function)
        observers.append(observer)
    }
    
    func unsubscribe(_ observer: Observer) {
       
        print(#function)
        
        if let index = observers.firstIndex(where: { $0 === observer }) {
            observers.remove(at: index)
            print(#function)
        }
    
    }
    
    func notify() {
        
        print(#function)
        observers.forEach( {$0.update(subject: self)} )
        
    }
    
    func someBusinessLogic() {
        
        print(#function)
        state = Int(arc4random_uniform(10))
        notify()
        
    }
    
}

class ConcreteObsirverA: Observer {
    
    func update(subject: NotificationCenters) {
        print("ConcreteObsirverA: \(subject.state)")
    }
    
}

class ViewController: UIViewController, Observer {
    
    let notificationCenter = NotificationCenters()
    let observer1 = ConcreteObsirverA()

    @IBOutlet weak var outOneLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func update(subject: NotificationCenters) {
        outOneLabel.text = "State subject: \(subject.state)"
    }
    
    @IBAction func updateAction(_ sender: UIButton) {
        notificationCenter.someBusinessLogic()
    }
    
    @IBAction func subscribeSwitch(_ sender: UISwitch) {
       
        if sender.isOn {
            notificationCenter.subscribe(self)
            notificationCenter.subscribe(observer1)
        } else {
            notificationCenter.unsubscribe(self)
            notificationCenter.unsubscribe(observer1)
        }
        
    }
    
}
