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
    var userDetailsViewModel = UserDetailsViewModel()
    func manager<T: Codable , U: Codable>(
        modelType: T.Type,
        type: EndPointType,
        requestModel: U,
        method: HTTPMethod,
        completion: @escaping Handler<T>
    )
    {
//        let access = userDetailsViewModel.details?.user_data?.access_token
        let headers: HTTPHeaders = [
            "access_token" : "6694b76aa1a75"
        ]
        guard let url = type.url else{
            completion(.failure(.invalidURL))
            return
        }
        
        AF.request(url , method: method,parameters: requestModel,encoder: URLEncodedFormParameterEncoder.default, headers: headers).response{
            response in
            //debugPrint(response)
            
            switch response.result {
            case .success(let data):
                
                    do{
                        if response.response?.statusCode == 200 {
//                           let jsonData = try JSONSerialization.jsonObject(with: data!,options: [])
                            
                            let decoder = JSONDecoder()
                            if let decoded = try? decoder.decode(T.self, from: data!) {
                                //print("Value of decoder == \(String(describing: (decoded as! LoginResponse).data?.access_token))")
                                completion(.success(decoded))
                                }
                            
                            //print(jsonData)
                            
//                            let resData = try JSONDecoder().decode(modelType, from: data!)
                            
                          //  completion(.success(T.self as! T))
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

