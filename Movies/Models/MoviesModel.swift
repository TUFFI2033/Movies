//
//  MoviesModel.swift
//  Movies
//
//  Created by Ivan Byndiu on 19/11/2023.
//

import Foundation

struct MoviesModel: Decodable {
    let title: String
    let released: String
    let runtime: String
    let genre: String
    let language: String
    let country: String
    let poster: String
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case released = "Released"
        case runtime = "Runtime"
        case genre = "Genre"
        case language = "Language"
        case country = "Country"
        case poster = "Poster"
    }
}
