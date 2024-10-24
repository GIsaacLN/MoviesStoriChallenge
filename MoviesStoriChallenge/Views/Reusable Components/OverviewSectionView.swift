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

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ScrollView{
                Text(movie.overview)
                    .font(.customBody)
                    .foregroundColor(.black)
                    .lineLimit(nil)
                
            }
            Spacer()

            HStack {
                Button {
                    isButtonPressed = true
                } label: {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.green900)
                        .frame(height: 60)
                }

                Button {
                    isButtonPressed = true
                } label: {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.green300)
                        .frame(height: 60)
                }
            }
            .padding(.top)
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
