//
//  CartModel.swift
//  NeoStoreMVVM
//
//  Created by Apple on 10/07/24.
//

import Foundation

struct CartModel: Codable {
    let status: Int
    let data: Bool
    let total_carts: Int
    let message: String
    let user_msg: String
}

struct CartRequest: Codable{
    let product_id: Int
    let quantity: Int
}

struct DelCartRequest: Codable {
    let product_id: Int
}
