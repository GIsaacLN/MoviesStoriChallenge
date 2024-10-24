//
//  MovieDetailViewModel.swift
//  MoviesStoriChallenge
//
//  Created by Gustavo Isaac Lopez Nunez on 22/10/24.
//

import Foundation

class MovieDetailViewModel: ObservableObject {
    @Published var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
}
