//
//  OverviewSectionView.swift
//  MoviesStoriChallenge
//
//  Created by Gustavo Isaac Lopez Nunez on 24/10/24.
//

import SwiftUI
import SafariServices

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
    OverviewSectionView(movie: Movie.placeholder2, isButtonPressed: .constant(true))
}

#Preview {
    OverviewSectionView(movie: Movie.placeholder2, isButtonPressed: .constant(false))
}

// MARK: - Safari View para Tráiler
struct SafariView: UIViewControllerRepresentable {
    let url: URL

    func makeUIViewController(context: Context) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {}
}

// MARK: - ShareSheet
struct ShareSheet: UIViewControllerRepresentable {
    var activityItems: [Any]

    func makeUIViewController(context: Context) -> UIActivityViewController {
        return UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}
