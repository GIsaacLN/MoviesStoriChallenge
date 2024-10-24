//
//  DateFormatterHelper.swift
//  MoviesStoriChallenge
//
//  Created by Gustavo Isaac Lopez Nunez on 24/10/24.
//

import Foundation

struct DateFormatterHelper {
    static let shared = DateFormatterHelper()

    // Formatter for "23 Sep 2024"
    func formatToFullDate(from dateString: String, inputFormat: String = "yyyy-MM-dd", outputFormat: String = "dd MMM yyyy") -> String {
        let inputDateFormatter = DateFormatter()
        inputDateFormatter.dateFormat = inputFormat

        let outputDateFormatter = DateFormatter()
        outputDateFormatter.dateFormat = outputFormat

        if let date = inputDateFormatter.date(from: dateString) {
            return outputDateFormatter.string(from: date)
        } else {
            return dateString // Return original string if parsing fails
        }
    }

    // Formatter for "2024"
    func formatToYear(from dateString: String, inputFormat: String = "yyyy-MM-dd", outputFormat: String = "yyyy") -> String {
        return formatToFullDate(from: dateString, inputFormat: inputFormat, outputFormat: outputFormat)
    }
}
