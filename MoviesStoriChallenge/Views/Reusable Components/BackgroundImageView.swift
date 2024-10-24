//
//  BackgroundImageView.swift
//  MoviesStoriChallenge
//
//  Created by Gustavo Isaac Lopez Nunez on 24/10/24.
//

import SwiftUI

struct BackgroundImageView: View {
    let posterPath: String?
    let isPosterPressed: Bool

    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(posterPath ?? "")")) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .clipped()
            } placeholder: {
                Color.green400
            }
            .grayscale(1.0)
            .frame(height: isPosterPressed ? .infinity : 250)
            .clipShape(RoundedRectangle(cornerRadius: 0))
            .blur(radius: isPosterPressed ? 20 : 0)

            Color.green900
                .opacity(0.5)
                .frame(height: isPosterPressed ? .infinity : 250)

            LinearGradient(
                colors: [Color.green900, Color.white.opacity(0)],
                startPoint: .bottom,
                endPoint: .top
            )
            .frame(height: isPosterPressed ? .infinity : 250)
        }
    }
}
