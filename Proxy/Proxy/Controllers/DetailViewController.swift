//
//  DetailViewController.swift
//  Proxy
//
//  Created by Raman Kozar on 29/10/2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    let url = URL(string: "https://www.pakainfo.com/wp-content/uploads/2021/09/image-url-for-testing.jpg")!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadImage()
    }
    
    @IBAction func refreshButton(_ sender: Any) {
        cacheData = nil
        imageView.image = nil
        loadImage()
    }
    
    func loadImage() {
        
        let imageService = LoadImageService()
        let proxy = Proxy(service: imageService)
        
        proxy.loadImage(url: url) { [weak self] data, response, error in
            
            guard let self = self, let data = data, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: data)
            }
            
        }
        
    }
    
}
