//
//  Login.swift
//  NeoStoreMVVM
//
//  Created by Apple on 02/07/24.
//

import Foundation

struct LoginModel: Codable {
    let email: String
    let password: String
}

struct LoginResponse: Codable {
    let success: Int
    let data: [LoginData]
    let message: String
    let user_msg: String
}
struct LoginData: Codable {
    
}
