//
//  MovieDetailView.swift
//  MoviesStoriChallenge
//
//  Created by Gustavo Isaac Lopez Nunez on 22/10/24.
//

import SwiftUI

struct MovieDetailView: View {
    @ObservedObject var viewModel: MovieDetailViewModel
    @State private var isButtonPressed = false
    @State private var isPosterPressed = false

    var body: some View {
        VStack(alignment: .leading, spacing: 130) {
            TopSectionView(
                movie: viewModel.movie,
                isPosterPressed: $isPosterPressed
            )
            .frame(height: isPosterPressed ? .infinity : 250)

            if !isPosterPressed {
                OverviewSectionView(
                    movie: viewModel.movie,
                    isButtonPressed: $isButtonPressed
                )
            }
        }
        .background(Color.white)
        .ignoresSafeArea(.all, edges: isPosterPressed ? .all : .bottom)
    }
}

#Preview {
    MovieDetailView(viewModel: MovieDetailViewModel(movie: Movie.placeholder2))
}
