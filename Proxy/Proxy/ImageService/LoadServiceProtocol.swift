//
//  LoadServiceProtocol.swift
//  Proxy
//
//  Created by Raman Kozar on 29/10/2023.
//

import Foundation

protocol LoadServiceProtocol {
    func loadImage(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ())
}
