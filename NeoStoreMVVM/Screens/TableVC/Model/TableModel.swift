//
//  Product.swift
//  NeoDemo
//
//  Created by Apple on 21/06/24.
//

import Foundation

struct TableProd : Codable {
        let status : Int
        let data : [TableData]
}

struct TableData : Codable {
    let id : Int
    let product_category_id : Int
    let name : String
    let producer : String
    let description : String
    let cost : Int
    let rating : Int
    let view_count : Int
    let created : String
    let modified : String
    let product_images : String
}

struct TableRequest: Codable {
    let product_category_id : Int
    let limit: Int
    let page : Int
}
