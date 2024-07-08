//
//  ProductEndPoint.swift
//  NeoStoreMVVM
//
//  Created by Apple on 08/07/24.
//

import Foundation
import Alamofire

 

protocol ProdEndPointType: Codable {
    var path: String { get }
    var baseURl: String { get }
    var url: URL? { get }
}

enum ProdEndPointItems {
    case getList
    case getDetail
    case setRating
}

extension ProdEndPointItems: ProdEndPointType{
    var path: String {
        switch self {
        case .getList:
            return "getList"
        case .getDetail:
            return "getDetail"
        case .setRating:
            return "setRating"
        }
        
    }
    
    var baseURl: String {
        return "http://staging.php-dev.in:8844/trainingapp/api/products/"
    }
    
    var url: URL? {
        return URL(string: "\(baseURl)\(path)")
    }
}
