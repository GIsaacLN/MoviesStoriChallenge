//
//  OverviewSectionView.swift
//  MoviesStoriChallenge
//
//  Created by Gustavo Isaac Lopez Nunez on 24/10/24.
//

import SwiftUI

struct OverviewSectionView: View {
    let movie: Movie
    @Binding var isButtonPressed: Bool
    @State private var showModal = false
    @State private var showTrailer = false
    @State private var showShareSheet = false

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ScrollView {
                Text(movie.overview)
                    .font(.customBody)
                    .foregroundColor(.black)
            }
            Spacer()

            ActionButtonsView(
                showTrailer: $showTrailer,
                showModal: $showModal,
                showShareSheet: $showShareSheet,
                movie: movie
            )
        }
        .padding()
    }
}

#Preview {
    OverviewSectionView(movie: Movie.placeholder2, isButtonPressed: .constant(true))
}

#Preview {
    OverviewSectionView(movie: Movie.placeholder2, isButtonPressed: .constant(false))
}
