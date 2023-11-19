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
        let key = "586a611f"
        var urlComponents = URLComponents(string: "https://www.omdbapi.com/")!
               urlComponents.queryItems = [
                   URLQueryItem(name: "apikey", value: key),
                   URLQueryItem(name: "t", value: search)
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
