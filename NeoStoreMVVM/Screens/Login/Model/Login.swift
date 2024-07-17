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
    let data: LoginData
    let message: String
    let user_msg: String
}
struct LoginData: Codable {
         let id: Int
         let role_id: Int
         let first_name: String
         let last_name: String
         let email: String
         let username: String
         let profile_pic: String
         let country_id: String
         let gender: String
         let phone_no: String
         let dob: String
         let is_active: Bool
         let created: String
         let modified:String
         let access_token: String
}
