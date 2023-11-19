//
//  NetworkRequest.swift
//  Movies
//
//  Created by Ivan Byndiu on 19/11/2023.
//

import Foundation

class NetworkRequest {
    
    static let shared = NetworkRequest()
    private init() {}
    
    func requestData(search: String, completion: @escaping (Result<Data, Error>) -> Void) {
        let key = "ae58e27dd4501279de6faa4f89203bb1"
        var urlComponents = URLComponents(string: "https://api.themoviedb.org/3/discover/movie")!
               urlComponents.queryItems = [
                   URLQueryItem(name: "api_key", value: key)
               ]
        
        guard let url = urlComponents.url else { return }
        
        URLSession.shared.dataTask(with: url) { data, responce, error in
            DispatchQueue.main.async {
                if let error {
                    completion(.failure(error))
                } else {
                    guard let data else { return }
                    completion(.success(data))
                }
            }
        }.resume()
    }
}
