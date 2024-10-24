//
//  Actina.swift
//  MoviesStoriChallenge
//
//  Created by Gustavo Isaac Lopez Nunez on 24/10/24.
//

import SwiftUI

struct ActionButtonsView: View {
    @Binding var showTrailer: Bool
    @Binding var showModal: Bool
    @Binding var showShareSheet: Bool
    let movie: Movie

    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 20) {
                CustomButtonView(
                    title: "Ver Tráiler",
                    backgroundColor: .green900,
                    foregroundColor: .green100
                ) { showTrailer = true }
                .sheet(isPresented: $showTrailer) {
                    SafariView(url: URL(string: "https://www.youtube.com/watch")!)
                }

                CustomButtonView(
                    title: "Compartir",
                    backgroundColor: .green300,
                    foregroundColor: .green900
                ) { showShareSheet = true }
                .sheet(isPresented: $showShareSheet) {
                    ShareSheet(activityItems: [movie.title, URL(string: "https://www.themoviedb.org/movie/\(movie.id)")!])
                }
            }

            CustomButtonView(
                title: "Ver Reseñas",
                backgroundColor: .green900,
                foregroundColor: .green100
            ) { showModal = true }
            .sheet(isPresented: $showModal) {
                ReviewsModalView(movie: movie)
            }
            .padding(.top)
        }
    }
}

#Preview {
    ActionButtonsView(showTrailer: .constant(false), showModal: .constant(false), showShareSheet: .constant(false), movie: Movie.placeholder2)
}
