//
//  GoogleAuthenticator.swift
//  Adapter_real
//
//  Created by Raman Kozar on 08/10/2023.
//

import Foundation

public struct GoogleUser {
    
    public var email: String
    public var password: String
    public var token: String
    
}

public class GoogleAuthenticator {
    
    public func login(email: String, password: String, complition: @escaping (GoogleUser?, Error?) -> Void) {
        
        let token = "Special-token-ramankozar"
        let user = GoogleUser(email: email, password: password, token: token)
        
        complition(user, nil)
        
    }
    
}
