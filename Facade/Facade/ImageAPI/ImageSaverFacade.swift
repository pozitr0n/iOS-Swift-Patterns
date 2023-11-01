//
//  ImageSaverFacade.swift
//  Facade
//
//  Created by Raman Kozar on 02/11/2023.
//

import Foundation
import UIKit

class ImageSaverFacade {
    
    private let pathProvider = PathProvider()
    private let dataProvider = ImageDataProvider()
    
    public func save(image: UIImage,
                     type: ImageType,
                     fileName: String,
                     overwrite: Bool) throws {
        
        let destinationURL = try pathProvider.createDestinationPath(fileName: fileName)
        let imageData = try dataProvider.data(from: image, type: type)
        let writeOptionals: Data.WritingOptions = overwrite ? (.atomic) : (.withoutOverwriting)
        
        try imageData.write(to: destinationURL, options: writeOptionals)
        
    }
    
}
