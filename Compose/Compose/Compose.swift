//
//  Compose.swift
//  Compose
//
//  Created by Raman Kozar on 29/10/2023.
//

import Foundation

protocol Compose {
    
    var name: String { get set }
    
    func showContent() -> Any
    func addComponent(c: Compose)
    func contentCount() -> Int
    
}

class File: Compose {
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func showContent() -> Any {
        return name
    }
    
    func addComponent(c: Compose) {
        print("To the file can't add a folder")
    }
    
    func contentCount() -> Int {
        return 1
    }
    
}

class Folder: Compose {
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    private var contentArray = [Compose]()
    
    func showContent() -> Any {
        return contentArray
    }
    
    func addComponent(c: Compose) {
        contentArray.append(c)
    }
    
    func contentCount() -> Int {
        return contentArray.count
    }
    
}
