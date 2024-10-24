//
//  TitleReleaseDateView.swift
//  MoviesStoriChallenge
//
//  Created by Gustavo Isaac Lopez Nunez on 24/10/24.
//

import SwiftUI

struct TitleReleaseDateView: View {
    let movie: Movie

    var body: some View {
        VStack(alignment: .leading) {
            Text(movie.title)
                .font(.customTitle)
                .bold()
                .foregroundColor(.green900)
                .lineLimit(2)

            Text(DateFormatterHelper.shared.formatToFullDate(from: movie.releaseDate))
                .font(.customCaption)
                .foregroundColor(.gray)
        }
        .frame(width: 200)
    }
}
