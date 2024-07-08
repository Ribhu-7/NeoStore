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
    case getProduct
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
        case .getProduct:
            return "products/getList?product_category_id=1"
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
