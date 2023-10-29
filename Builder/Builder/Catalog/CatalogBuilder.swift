//
//  CatalogBuilder.swift
//  Builder
//
//  Created by Raman Kozar on 29/10/2023.
//

import Foundation
import UIKit

class CatalogBuilder: ModuleBuilderProtocol {
    
    var titleViewController: String?
    
    func setTitle(_ title: String) -> CatalogBuilder {
        self.titleViewController = title
        return self
    }
    
    func build() -> UIViewController {
        
        guard let title = titleViewController else {
            fatalError("You must add \"Title\"")
        }
        
        let presenter = CatalogPresenter()
        let interactor = CatalogInteractor(presenter: presenter)
        let controller = CatalogViewController(title: title, interactor: interactor)
        
        presenter.viewController = controller
        
        return controller
        
    }
    
}
