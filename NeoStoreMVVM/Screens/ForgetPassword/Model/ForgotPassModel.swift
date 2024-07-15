//
//  ForgotPassModel.swift
//  NeoStoreMVVM
//
//  Created by Apple on 15/07/24.
//

import Foundation

struct ForgotRequest: Codable {
    let email: String
}

struct ForgotResponse: Codable {
    let status: Int
    let message: String
    let user_msg: String
}
