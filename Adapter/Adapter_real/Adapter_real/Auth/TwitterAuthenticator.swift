//
//  TwitterAuthenticator.swift
//  Adapter_real
//
//  Created by Raman Kozar on 08/10/2023.
//

import Foundation

public struct TwitterUser {
    
    public var email: String
    public var password: String
    public var token: String
    
}

public class TwitterAuthenticator {
    
    public func login(email: String, password: String, complition: @escaping (TwitterUser?, Error?) -> Void) {
        
        let token = "Special-token-ramankozar"
        let user = TwitterUser(email: email, password: password, token: token)
        
        complition(user, nil)
        
    }
    
}
