//
//  OrderDetailsModel.swift
//  NeoStoreMVVM
//
//  Created by Apple on 18/07/24.
//

import Foundation

struct OrderDetails: Codable {
    let status: Int?
    let data: OrderDetailsData?
    let message: String?
    let user_msg: String?
}

struct OrderDetailsData: Codable{
    let id : Int?
    let cost : Int?
    let address : String?
    let order_details : [OrderData_details]?
}

struct OrderData_details: Codable {
    let id : Int?
    let order_id : Int?
    let product_id : Int?
    let quantity : Int?
    let total : Int?
    let prod_name : String?
    let prod_cat_name : String?
    let prod_image : String?
}

struct OrderDetailsRequest: Codable {
    let order_id: Int?
}
