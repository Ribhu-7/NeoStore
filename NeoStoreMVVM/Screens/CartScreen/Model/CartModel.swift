//
//  CartModel.swift
//  NeoStoreMVVM
//
//  Created by Apple on 10/07/24.
//

import Foundation

struct CartModel {
    let status: Int
    let data: Bool
    let total_carts: Int
    let message: String
    let user_msg: String
}

struct CartRequest{
    let product_id: Int
    let quantity: Int
}
