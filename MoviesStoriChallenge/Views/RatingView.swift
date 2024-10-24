//
//  RatingView.swift
//  MoviesStoriChallenge
//
//  Created by Gustavo Isaac Lopez Nunez on 23/10/24.
//

import SwiftUI

struct RatingView: View {
    let rating: Double
    
    var body: some View {
        // Rating circle
        ZStack {
            Circle()
                .fill(Color.green200)
                .frame(width: 68, height: 68)
            
            Circle()
                .trim(from: 0, to: CGFloat(1))
                .stroke(Color.green400, lineWidth: 5)
                .frame(width: 68, height: 68)

            Circle()
                .trim(from: 0, to: CGFloat(rating / 10))
                .stroke(Color.green900, lineWidth: 5)
                .rotationEffect(.degrees(-90))
                .frame(width: 68, height: 68)

            Text("\(rating, specifier: "%.1f")")
                .font(.customRating)
                .foregroundStyle(.green900)
                .bold()
        }
    }
}

#Preview {
    RatingView(rating: 8.7)
}
