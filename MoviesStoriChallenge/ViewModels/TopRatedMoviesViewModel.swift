//
//  TopRatedMoviesViewModel.swift
//  MoviesStoriChallenge
//
//  Created by Gustavo Isaac Lopez Nunez on 22/10/24.
//

import Foundation
import Combine

class TopRatedMoviesViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    private var currentPage = 1
    private var totalPages = 1
    
    func fetchMovies() {
        guard currentPage <= totalPages else { return }
        
        MovieAPIService.shared.fetchTopRatedMovies(page: currentPage) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    self?.movies.append(contentsOf: response.results)
                    self?.currentPage += 1
                    self?.totalPages = response.totalPages
                case .failure(let error):
                    self?.handleError(error)
                }
            }
        }
    }
    
    private func handleError(_ error: Error) {
        print("Error fetching movies: \(error.localizedDescription)")
    }
}
