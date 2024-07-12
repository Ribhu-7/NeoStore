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
    var userDetailsViewModel = UserDetailsViewModel()
    func helpRequest<T: Codable>(
        modelType: T.Type,
        type: EndPointType,
        completion: @escaping Helper<T>
    )
    {
        guard let url = type.url else{
            completion(.failure(.invalidURL))
            return
        }
        //let access = userDetailsViewModel.details?.user_data?.access_token
        //print(access ?? "")
        var request = URLRequest(url: url)
        request.setValue("6686300231b21", forHTTPHeaderField: "access_token")
        
        URLSession.shared.dataTask(with: request){data,response,error in
            guard let data , error == nil else {
                completion(.failure(.invalidData))
                
                return
            }
            
            guard let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode else {
                completion(.failure(.invalidResponse))
                return
            }
            
            do {
                let jsonData = try JSONDecoder().decode(modelType, from: data)
                completion(.success(jsonData))
            } catch{
                completion(.failure(.network(error)))
            }
            
        }.resume()
    }
}
