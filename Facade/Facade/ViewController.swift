//
//  ViewController.swift
//  Facade
//
//  Created by Raman Kozar on 02/11/2023.
//

import UIKit

enum ImageSaverErrors: Error {
    case couldNotCreateDestinationPath
    case couldNotCreateJPEGDataFromImage
    case couldNotCreatePNGDataFromImage
    case couldNotSaveImageDestinationPath
}

enum ImageType {
    case png
    case jpeg(compressionQuality: CGFloat)
}

class ViewController: UIViewController {

    let imageSaverFacade = ImageSaverFacade()
    let image = UIImage(named: "apple-logo")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            try imageSaverFacade.save(image: image, type: .jpeg(compressionQuality: 100.0), fileName: "my_file_name", overwrite: true)
        } catch {
            print(error)
        }
        
    }

}

