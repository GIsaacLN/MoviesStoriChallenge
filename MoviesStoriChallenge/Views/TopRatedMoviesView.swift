//
//  TopRatedMoviesView.swift
//  MoviesStoriChallenge
//
//  Created by Gustavo Isaac Lopez Nunez on 22/10/24.
//

import SwiftUI

struct TopRatedMoviesView: View {
    @StateObject private var viewModel = TopRatedMoviesViewModel()
    @State private var selectedMovie: Movie?
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Top Rated Movies")
                    .font(.customTitle)
                    .foregroundColor(Color.green900)

                MovieTableView(movies: $viewModel.movies, onReachedEnd: {
                    viewModel.fetchMovies()
                }, onSelectMovie: { movie in
                    selectedMovie = movie
                })
                .padding(.horizontal)
                .onAppear {
                    if viewModel.movies.isEmpty {
                        viewModel.fetchMovies()
                    }
                }
                
                NavigationLink(
                    destination: MovieDetailView(viewModel: MovieDetailViewModel(movie: selectedMovie ?? viewModel.movies.first ?? Movie.placeholder)),
                    isActive: Binding<Bool>(
                        get: { self.selectedMovie != nil },
                        set: { newValue in
                            if !newValue {
                                self.selectedMovie = nil
                            }
                        }
                    )
                ) {
                    EmptyView()
                }
            }
            .navigationBarHidden(true)
            .background(Color.white)
        }
    }
}
