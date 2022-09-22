//
//  NetworkManager.swift
//  MoviesDemoApp
//
//  Created by karma on 9/20/22.
//

import Foundation
import Alamofire

class NetworkManager {
    
//    static func getApi<D: Decodable>(with url: URL, completion: @escaping(Result<D,Error>) -> Void) {
//        AF.request(url).response { response in
//            guard let statusCode = response.response?.statusCode else { return }
//            if statusCode >= 200 && statusCode < 300 {
//                completion(.success())
//            }
//        }
//    }
    
    static func getDiscover(completion: @escaping(Result<Discover, Error>) -> Void) {
        AF.request(Endpoints.discover.url).response { response in
            debugPrint(response)
            guard let statusCode = response.response?.statusCode else { return }
            if statusCode >= 200 && statusCode < 300 {
                do {
                    guard let data = response.data else { return }
                    let result = try JSONDecoder().decode(Discover.self, from: data)
                    completion(.success(result))
                } catch let error {
                    completion(.failure(error))
                }
            }
        }
    }
    
    static func getMovieDetail(with id: Int, completion: @escaping(Result<MovieDetail,Error>) -> Void) {
        AF.request(Endpoints.movie(id: id).url).response { response in
            guard let statusCode = response.response?.statusCode else { return }
            if statusCode >= 200 && statusCode < 300 {
                do {
                    guard let data = response.data else { return }
                    let result = try JSONDecoder().decode(MovieDetail.self, from: data)
                    completion(.success(result))
                } catch let error {
                    completion(.failure(error))
                }
            }
        }
    }
    
}
