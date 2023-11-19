//
//  MoviesModel.swift
//  Movies
//
//  Created by Ivan Byndiu on 19/11/2023.
//

import Foundation

struct MoviesModel: Decodable {
    let results: [Result]
    
    struct Result: Decodable {
        let title: String
        let releaseDate: String
        let overview: String
        let backdropPath: String

        enum CodingKeys: String, CodingKey {
            case title, overview
            case releaseDate = "release_date"
            case backdropPath = "backdrop_path"
        }
    }
}
