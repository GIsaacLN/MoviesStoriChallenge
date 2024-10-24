//
//  Movie.swift
//  MoviesStoriChallenge
//
//  Created by Gustavo Isaac Lopez Nunez on 22/10/24.
//

import Foundation

struct Movie: Identifiable, Decodable, Equatable {
    let id: Int
    let title: String
    let posterPath: String?
    let releaseDate: String
    let overview: String
    let voteAverage: Double
    let rating: Int?

    enum CodingKeys: String, CodingKey {
        case id, title, posterPath = "poster_path", releaseDate = "release_date", overview, voteAverage = "vote_average", rating
    }

    static var placeholder: Movie {
        Movie(id: 0, title: "Placeholder", posterPath: nil, releaseDate: "N/A", overview: "N/A", voteAverage: 0.0, rating: nil)
    }
    
    static var placeholder2: Movie {
        Movie(
            id: 238,
            title: "The Godfather",
            posterPath: "/3bhkrj58Vtu7enYsRolD1fZdja1.jpg",
            releaseDate: "1972-03-14",
            overview: "Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.",
            voteAverage: 8.7,
            rating: nil
        )
    }

}
