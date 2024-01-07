//
//  NetworkImageRequest.swift
//  Movies
//
//  Created by Ivan Byndiu on 03/12/2023.
//

import Foundation

class NetworkImageRequest {
    
    static let shared = NetworkImageRequest()
    private init() {}
    
    func requestData(poster: String, completion: @escaping (Result<Data, Error>) -> Void) {
        
        let urlString = "https://image.tmdb.org/t/p/w200\(poster)"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, responce, error in
            DispatchQueue.main.async {
                if let error {
                    completion(.failure(error))
                } else {
                    guard let data else { return }
                    completion(.success(data))
                }
            }
        }
        .resume()
    }
}
