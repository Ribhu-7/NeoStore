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
    var method: HTTPMethod { get }
}

enum EndPointItems {
    case register
    case login
}

extension EndPointItems: EndPointType{
    var path: String {
        switch self {
        case .register:
            return "register"
        case .login:
            return "login"
        }
        
    }
    
    var baseURl: String {
        return "http://staging.php-dev.in:8844/trainingapp/api/users/"
    }
    
    var url: URL? {
        return URL(string: "\(baseURl)\(path)")
    }
    
    var method: HTTPMethod {
        switch self {
        case .register:
            return .post
        case .login:
            return .get
        }
        
        
    }
    
    
}
