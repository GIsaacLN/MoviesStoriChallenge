//
//  MovieResponse.swift
//  MoviesStoriChallenge
//
//  Created by Gustavo Isaac Lopez Nunez on 22/10/24.
//

import Foundation

struct MovieResponse: Decodable {
    let page: Int
    let results: [Movie]
    let totalPages: Int
    let totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case page, results, totalPages = "total_pages", totalResults = "total_results"
    }
}
