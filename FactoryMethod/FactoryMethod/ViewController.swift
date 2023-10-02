//
//  ViewController.swift
//  FactoryMethod
//
//  Created by Raman Kozar on 01/10/2023.
//

import UIKit

class ViewController: UIViewController {

    var excercisesArray = [Excercise]()
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create jumping
        createExcercise(exName: .jumping)
        
        // create squarts
        createExcercise(exName: .squarts)
        
        // run all the excercise
        runExcercise()
        
    }
    
    func createExcercise(exName: Excercises) {
        
        let newExcercise = FactoryExcercises.defaultFactory.createExcercise(name: exName)
        excercisesArray.append(newExcercise)
        
    }
    
    func runExcercise() {
        for exercise in excercisesArray {
            exercise.start()
        }
    }
    
    func stopExcercise() {
        for exercise in excercisesArray {
            exercise.stop()
        }
    }

}

