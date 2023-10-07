//
//  AuthService.swift
//  Adapter_real
//
//  Created by Raman Kozar on 08/10/2023.
//

import Foundation

public struct User {

    public let email: String
    public let password: String
    
}

public struct Token {

    public let value: String
    
}

// High abstraction level
//
public protocol AuthService {
    
    func login(email: String,
               password: String,
               sucsess: @escaping (User?, Token) -> Void,
               failure: @escaping (Error?) -> Void)
    
}
