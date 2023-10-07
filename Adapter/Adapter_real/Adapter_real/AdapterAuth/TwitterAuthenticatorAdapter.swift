//
//  TwitterAuthenticatorAdapter.swift
//  Adapter_real
//
//  Created by Raman Kozar on 08/10/2023.
//

import Foundation

class TwitterAuthenticatorAdapter: AuthService {
    
    private var authenticator = TwitterAuthenticator()
    
    public func login(email: String, password: String, sucsess: @escaping (User?, Token) -> Void, failure: @escaping (Error?) -> Void) {
        
        authenticator.login(email: email, password: password) { currentUser, error in
            
            guard let currentUser = currentUser else {
                failure(error)
                return
            }
            
            let user = User(email: currentUser.email, password: currentUser.password)
            let token = Token(value: currentUser.token)
            
            sucsess(user, token)
            
        }
        
    }
    
}
