//
//  APIManager.swift
//  NeoStoreMVVM
//
//  Created by Apple on 02/07/24.
//

import Foundation
import Alamofire
import UIKit

enum DataError: Error {
    case invalidResponse
    case invalidDecoding
    case invalidURL
    case invalidData
    case network(String)
}

typealias Handler<T> = (Result<T,DataError>) -> Void

final class APIManager {
    static let shared = APIManager()
    private init() {}
    
    func manager<T: Codable , U: Codable>(
        modelType: T.Type,
        type: EndPointType,
        requestModel: U,
        method: HTTPMethod,
        completion: @escaping Handler<Any>
    )
    {
        guard let url = type.url else{
            completion(.failure(.invalidURL))
            return
        }
        
        AF.request(url , method: method,parameters: requestModel,encoder: URLEncodedFormParameterEncoder.default, headers: nil).response{
            response in
            debugPrint(response)
            
            switch response.result {
            case .success(let data):
                
                    do{
                        if response.response?.statusCode == 200 {
                            let jsonData = try JSONSerialization.jsonObject(with: data!,options: [])
                            print(jsonData)
                            
                            completion(.success(jsonData))
                        }
                        
                    } catch{
                        completion(.failure(.invalidData))
                        print(error.localizedDescription)
                    }
                
                
                
            case .failure:
                completion(.failure(.network("invalid")))
            }
        }
    }
}

