//
//  ViewController.swift
//  Adapter_real
//
//  Created by Raman Kozar on 08/10/2023.
//

import UIKit

class ViewController: UIViewController {

    let authServiceGoogle: AuthService = GoogleAuthenticatorAdapter()
    let authServiceTwitter: AuthService = TwitterAuthenticatorAdapter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createUserGoogle(email: "rkozar_google@gmail.com", password: "1q2w3e4r")
        createUserTwitter(email: "rkozar_twitter@gmail.com", password: "5t6y7u8i")
        
    }

}

extension ViewController {
    
    func createUserGoogle(email: String, password: String) {
        
        authServiceGoogle.login(email: email, password: password) { user, token in
            
            guard let user = user else {
                return
            }
            
            print("AuthSucess! \(user.email) \(token.value)")
            
        } failure: { error in
            
            if let error = error {
                print(error.localizedDescription)
            }
            
        }

    }
    
    func createUserTwitter(email: String, password: String) {
        
        authServiceTwitter.login(email: email, password: password) { user, token in
            
            guard let user = user else {
                return
            }
            
            print("AuthSucess! \(user.email) \(token.value)")
            
        } failure: { error in
            
            if let error = error {
                print(error.localizedDescription)
            }
            
        }
        
    }
    
}

