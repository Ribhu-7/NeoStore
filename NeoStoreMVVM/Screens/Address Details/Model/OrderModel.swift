//
//  OrderModel.swift
//  NeoStoreMVVM
//
//  Created by Apple on 17/07/24.
//

import Foundation

struct OrderModel: Codable {
    
    let status: Int
    let message: String
    let user_msg: String
    
}

struct OrderRequest: Codable {
    let address: String
}
