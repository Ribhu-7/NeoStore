//
//  EndPointType.swift
//  NeoStoreMVVM
//
//  Created by Apple on 02/07/24.
//

import Foundation
import Alamofire

 

protocol EndPointType: Codable {
    var path: String { get }
    var baseURl: String { get }
    var url: URL? { get }
}

enum EndPointItems {
    case register
    case login
    case getTable
    case getChair
    case getSofa
    case getCupboard
    case getDetail
    case setRating
}

extension EndPointItems: EndPointType{
    var path: String {
        switch self {
        case .register:
            return "users/register"
        case .login:
            return "users/login"
        case .getTable:
            return "products/getList?product_category_id=1"
        case .getChair:
            return "products/getList?product_category_id=2"
        case .getSofa:
            return "products/getList?product_category_id=3"
        case .getCupboard:
            return "products/getList?product_category_id=4"
        case .getDetail:
            return "products/getDetail"
        case .setRating:
            return "products/setRating"
        }
    
    }
    
    var baseURl: String {
        return "http://staging.php-dev.in:8844/trainingapp/api/"
    }
    
    var url: URL? {
        return URL(string: "\(baseURl)\(path)")
    }
    
    
}
