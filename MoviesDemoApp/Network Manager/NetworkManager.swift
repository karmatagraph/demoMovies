//
//  NetworkManager.swift
//  MoviesDemoApp
//
//  Created by karma on 9/20/22.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static func getApi<D: Decodable>(with endpoint: Endpoints, expecting: D.Type, completion: @escaping(Result<D,Error>) -> Void) {
        AF.request(endpoint.url).response { response in
            guard let statusCode = response.response?.statusCode else { return }
            if statusCode >= 200 && statusCode < 300 {
                guard let data = response.data else { return }
                do {
                    let result = try JSONDecoder().decode(expecting, from: data)
                    completion(.success(result))
                } catch let error {
                    print("decode error:::\(error.localizedDescription)")
                }
            }
        }
    }
    
}
