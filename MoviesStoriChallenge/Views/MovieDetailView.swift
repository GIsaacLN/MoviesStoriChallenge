//
//  MovieDetailView.swift
//  MoviesStoriChallenge
//
//  Created by Gustavo Isaac Lopez Nunez on 22/10/24.
//

import SwiftUI

struct MovieDetailView: View {
    @ObservedObject var viewModel: MovieDetailViewModel
    @State private var isButtonPressed = false
    @State private var isPosterPressed = false

    var body: some View {
        VStack(alignment: .leading, spacing: 130) {
            TopSectionView(
                movie: viewModel.movie,
                isPosterPressed: $isPosterPressed
            )
            .frame(height: isPosterPressed ? .infinity : 250)

            if !isPosterPressed {
                OverviewSectionView(
                    movie: viewModel.movie,
                    isButtonPressed: $isButtonPressed
                )
            }
        }
        .background(Color.white)
        .ignoresSafeArea(.all, edges: isPosterPressed ? .all : .bottom)
    }
}

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
    MovieDetailView(viewModel: MovieDetailViewModel(movie: Movie.placeholder2))
}
