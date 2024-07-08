//
//  APIHelper.swift
//  NeoStoreMVVM
//
//  Created by Apple on 08/07/24.
//

import UIKit

//Singleton preventing inheritance as well as object instance

enum DatasError: Error {
    case invalidResponse
    case invalidDecoding
    case invalidURL
    case invalidData
    case network(_ error: Error?)
}


typealias Helper<T> = (Result<T, DatasError>)->Void

final class APIHelper {
    
    static let shared = APIHelper()
    private init() {}
    
    func helpRequest<T: Decodable>(
        modelType: T.Type,
        type: EndPointType,
        completion: @escaping Helper<T>
    )
    {
        guard let url = type.url else{
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url){data,response,error in
            guard let data , error == nil else {
                completion(.failure(.invalidData))
                
                return
            }
            
            guard let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode else {
                completion(.failure(.invalidResponse))
                return
            }
            
            do {
                let products = try JSONDecoder().decode(modelType, from: data)
                completion(.success(products))
            } catch{
                completion(.failure(.network(error)))
            }
            
        }.resume()
    }
}
