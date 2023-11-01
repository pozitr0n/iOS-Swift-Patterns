//
//  PathProvider.swift
//  Facade
//
//  Created by Raman Kozar on 02/11/2023.
//

import Foundation

class PathProvider {
    
    func createDestinationPath(fileName: String) throws -> URL {
        
        guard let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            throw ImageSaverErrors.couldNotCreateDestinationPath
        }
        
        let destinationPath = path.appendingPathComponent("\(fileName)")
        print(destinationPath)
        
        return destinationPath
        
    }
    
}
