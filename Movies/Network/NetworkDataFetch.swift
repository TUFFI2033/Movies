//
//  NetworkDataFetch.swift
//  Movies
//
//  Created by Ivan Byndiu on 19/11/2023.
//

import Foundation

class NetworkDataFetch {
    
    static let shared = NetworkDataFetch()
    private init() {}
    
    func fetchMovies(responce: @escaping (MoviesModel?, Error?) -> Void) {
        NetworkRequest.shared.requestData(search: "joker") { result in
            switch result {
            case .success(let data):
                do {
                    let movies = try JSONDecoder().decode(MoviesModel.self, from: data)
                    responce(movies, nil)
                } catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                }
            case .failure(let error):
                print(error.localizedDescription)
                responce(nil, error)
            }
        }
    }
}
