//
//  CatalogPresenter.swift
//  Builder
//
//  Created by Raman Kozar on 29/10/2023.
//

import Foundation

protocol Presenter {
    var messageInfo: String { get }    
}

class CatalogPresenter: Presenter {
 
    weak var viewController: CatalogViewController?
    var messageInfo = "Can create viewModel for presentation"
    
}
