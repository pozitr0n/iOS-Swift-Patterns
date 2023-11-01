//
//  ImageDataProvider.swift
//  Facade
//
//  Created by Raman Kozar on 02/11/2023.
//

import Foundation
import UIKit

class ImageDataProvider {
    
    public func data(from image: UIImage, type: ImageType) throws -> Data {
    
        switch type {
        case .png:
            return try pngDataFromImage(from: image)
        case .jpeg(let compressionQuality):
            return try jpegDataFromImage(from: image, compressionQuality: compressionQuality)
        }
        
    }
    
    private func pngDataFromImage(from image: UIImage) throws -> Data {
        guard let imageData = image.pngData() else {
            throw ImageSaverErrors.couldNotCreatePNGDataFromImage
        }
        return imageData
    }
    
    private func jpegDataFromImage(from image: UIImage, compressionQuality: CGFloat) throws -> Data {
        guard let imageData = image.jpegData(compressionQuality: compressionQuality) else {
            throw ImageSaverErrors.couldNotCreateJPEGDataFromImage
        }
        return imageData
    }
    
}
