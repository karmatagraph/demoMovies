//
//  NetworkManager.swift
//  MoviesDemoApp
//
//  Created by karma on 9/20/22.
//

import Foundation
import Alamofire

class NetworkManager {
    static func getPopular(completion: @escaping(Result<Bool, Error>) -> Void) {
        AF.request(Endpoints.popular.url).response { response in
            debugPrint(response)
            guard let statusCode = response.response?.statusCode else { return }
            if statusCode >= 200 && statusCode < 300 {
                completion(.success(true))
            } else if statusCode <= 300 && statusCode > 400 {
                print("redirect error")
            } else if statusCode <= 500 {
                print("server error")
            } else if statusCode <= 400 && statusCode < 500 {
                completion(.success(false))
                print("bad url request")
            } else {
                completion(.success(false))
            }
        }
    }
}
