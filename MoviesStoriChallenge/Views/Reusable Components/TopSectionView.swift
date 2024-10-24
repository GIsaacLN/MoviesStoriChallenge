//
//  TopSectionView.swift
//  MoviesStoriChallenge
//
//  Created by Gustavo Isaac Lopez Nunez on 24/10/24.
//

import SwiftUI

struct TopSectionView: View {
    let movie: Movie
    @Binding var isPosterPressed: Bool

    var body: some View {
        ZStack(alignment: .center) {
            BackgroundImageView(
                posterPath: movie.posterPath,
                isPosterPressed: isPosterPressed
            )

            HStack(alignment: isPosterPressed ? .center : .bottom) {
                PosterImageView(
                    posterPath: movie.posterPath,
                    rating: movie.voteAverage,
                    isPosterPressed: $isPosterPressed
                )
                .offset(x: isPosterPressed ? -40 : 0)

                if !isPosterPressed {
                    TitleReleaseDateView(movie: movie)
                }
            }
            .padding(.top, isPosterPressed ? 0 : 200)
        }
    }
}

#Preview {
    TopSectionView(movie: Movie.placeholder2, isPosterPressed: .constant(true))
}
