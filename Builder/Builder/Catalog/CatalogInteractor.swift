//
//  CatalogInteractor.swift
//  Builder
//
//  Created by Raman Kozar on 29/10/2023.
//

import Foundation

protocol Interactor {
    init(presenter: Presenter)
}

class CatalogInteractor: Interactor {
    
    var presenter: Presenter!
    
    // Business-logic
    
    required init(presenter: Presenter) {
        self.presenter = presenter
    }
    
}
