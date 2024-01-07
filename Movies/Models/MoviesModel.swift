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
        let id: Int
        let posterPath: String
        let voteAverage: Double

        enum CodingKeys: String, CodingKey {
            case title, overview, id
            case releaseDate = "release_date"
            case posterPath = "poster_path"
            case voteAverage = "vote_average"
        }
    }
}
