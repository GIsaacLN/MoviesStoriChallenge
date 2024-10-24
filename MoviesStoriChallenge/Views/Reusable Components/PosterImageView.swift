//
//  PosterImageView.swift
//  MoviesStoriChallenge
//
//  Created by Gustavo Isaac Lopez Nunez on 24/10/24.
//

import SwiftUI

struct PosterImageView: View {
    let posterPath: String?
    let rating: Double
    @Binding var isPosterPressed: Bool

    var body: some View {
        ZStack{
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(posterPath ?? "")")) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .clipped()
            } placeholder: {
                Color.green400
            }
            .frame(width: isPosterPressed ? 250 : 150, height: isPosterPressed ? 417 : 250)
            .clipShape(RoundedRectangle(cornerRadius: isPosterPressed ? 20 : 10))
            .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 4)
            .onTapGesture {
                withAnimation {
                    isPosterPressed.toggle()
                }
            }

            if !isPosterPressed {
                RatingView(rating: rating)
                    .offset(x: -50, y: 110)
            }
        }
    }
}
