//
//  MovieAPIService.swift
//  MoviesStoriChallenge
//
//  Created by Gustavo Isaac Lopez Nunez on 22/10/24.
//

import Foundation

class MovieAPIService {
    static let shared = MovieAPIService()
    private init() {}
    
    private let accessToken = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3NTgwNjdjZTkzMWM2Yjg0MWFlZjM4OGQxMzliYjBiNyIsIm5iZiI6MTcyOTY0MDAzMy41NzgyMTksInN1YiI6IjY3MTgxYmRhMjdiZDU3ZDkxZjYyMDlkOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.3-yVdlBKnEoABJecoPLwUnIQQdWU3W4AkxL6mK2FOK8"
    private let baseURL = "https://api.themoviedb.org/3"
    
    func fetchTopRatedMovies(page: Int = 1, completion: @escaping (Result<MovieResponse, Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)/movie/top_rated?language=es-MX&page=\(page)") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = [
            "accept": "application/json",
            "Authorization": "Bearer \(accessToken)"
        ]
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                // Handle no data scenario
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let movieResponse = try decoder.decode(MovieResponse.self, from: data)
                completion(.success(movieResponse))
            } catch let decodeError {
                completion(.failure(decodeError))
            }
        }
        task.resume()
    }
}
