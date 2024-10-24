//
//  ReviewsModalView.swift
//  MoviesStoriChallenge
//
//  Created by Gustavo Isaac Lopez Nunez on 24/10/24.
//

import SwiftUI

struct ReviewsModalView: View {
    let movie: Movie
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            VStack {
                Text("Reseñas de \(movie.title)")
                    .font(.customTitle)
                    .foregroundStyle(.green900)
                    .padding()

                ScrollView {
                    ForEach(0..<5) { _ in
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Usuario \(Int.random(in: 1...100))")
                                .font(.customTitle2)
                                .foregroundStyle(.green900)
                            Text("Esta película fue increíble, una de las mejores que he visto en mi vida. La recomiendo al 100%.")
                                .font(.customBody)
                                .foregroundStyle(.green400)
                        }
                        .padding()
                        Divider()
                    }
                }
            }
            .background(Color.white)
            .navigationBarItems(trailing: Button("Cerrar") {
                dismiss()
            })
        }
    }
}

#Preview {
    ReviewsModalView(movie: Movie.placeholder2)
}
