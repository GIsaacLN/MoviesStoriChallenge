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
                    .lineLimit(nil)
            }
            Spacer()

            VStack (spacing: 0) {
                HStack(spacing: 20) {
                    // Botón para ver el tráiler (simulado con un SafariView)
                    CustomButtonView(
                        title: "Ver Tráiler",
                        backgroundColor: .green900,
                        foregroundColor: .green100
                    ) {
                        showTrailer = true
                    }
                    .sheet(isPresented: $showTrailer) {
                        SafariView(url: URL(string: "https://www.youtube.com/watch?v=example_trailer")!)
                    }

                    // Botón para compartir la película
                    CustomButtonView(
                        title: "Compartir",
                        backgroundColor: .green300,
                        foregroundColor: .green900
                    ) {
                        showShareSheet = true
                    }
                    .sheet(isPresented: $showShareSheet) {
                        ShareSheet(activityItems: [movie.title, URL(string: "https://www.themoviedb.org/movie/\(movie.id)")!])
                    }
                }
                // Botón para mostrar reseñas en un modal
                CustomButtonView(
                    title: "Ver Reseñas",
                    backgroundColor: .green900,
                    foregroundColor: .green100
                ) {
                    showModal = true
                }
                .sheet(isPresented: $showModal) {
                    ReviewsModalView(movie: movie)
                }
                .padding(.top)
            }
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

// MARK: - Modal de Reseñas

struct ReviewsModalView: View {
    let movie: Movie
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            VStack {
                Text("Reseñas de \(movie.title)")
                    .font(.customTitle)
                    .padding()

                ScrollView {
                    ForEach(0..<5) { _ in
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Usuario \(Int.random(in: 1...100))")
                                .font(.headline)
                                .foregroundColor(.green900)
                            Text("Esta película fue increíble, una de las mejores que he visto en mi vida. La recomiendo al 100%.")
                                .font(.customBody)
                                .foregroundColor(.gray)
                        }
                        .padding()
                        Divider()
                    }
                }
            }
            .navigationBarItems(trailing: Button("Cerrar") {
                dismiss()
            })
        }
    }
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
