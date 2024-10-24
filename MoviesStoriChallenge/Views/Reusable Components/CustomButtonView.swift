//
//  CustomButtonView.swift
//  MoviesStoriChallenge
//
//  Created by Gustavo Isaac Lopez Nunez on 24/10/24.
//

import SwiftUI

struct CustomButtonView: View {
    let title: String
    let backgroundColor: Color
    let foregroundColor: Color
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(backgroundColor)
                    .frame(height: 60)
                
                Text(title)
                    .font(.customTitle2)
                    .foregroundStyle(foregroundColor)
            }
        }
    }
}

#Preview {
    CustomButtonView(
        title: "Aprietame",
        backgroundColor: .green900,
        foregroundColor: .green100
    ) {
        print("Button pressed")
    }
}
