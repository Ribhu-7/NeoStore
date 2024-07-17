//
//  OrderListModel.swift
//  NeoStoreMVVM
//
//  Created by Apple on 17/07/24.
//

import Foundation

struct OrderListModel: Codable {
    let status: Int
    let data: [OrderData]
    let message: String
    let user_msg: String
}

struct OrderData: Codable {
    let id: Int
    let cost: Int
    let created: String
}
