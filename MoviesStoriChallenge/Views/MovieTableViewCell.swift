//
//  MovieTableViewCell.swift
//  MoviesStoriChallenge
//
//  Created by Gustavo Isaac Lopez Nunez on 23/10/24.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    private let movieImageView = UIImageView()
    private let titleLabel = UILabel()
    private let releaseDateLabel = UILabel()
    private let stackView = UIStackView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }

    func setupViews() {
        movieImageView.contentMode = .scaleAspectFit
        movieImageView.translatesAutoresizingMaskIntoConstraints = false
        movieImageView.layer.cornerRadius = 5
        movieImageView.clipsToBounds = true
        movieImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        movieImageView.heightAnchor.constraint(equalToConstant: 75).isActive = true

        titleLabel.font = .customTitle2
        titleLabel.textColor = .green900

        releaseDateLabel.font = .customCaption
        releaseDateLabel.textColor = .green600

        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(releaseDateLabel)

        let containerStackView = UIStackView(arrangedSubviews: [movieImageView, stackView])
        containerStackView.axis = .horizontal
        containerStackView.spacing = 10
        containerStackView.alignment = .center
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        containerStackView.backgroundColor = .green200
        
        contentView.addSubview(containerStackView)
        NSLayoutConstraint.activate([
            containerStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            containerStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            containerStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            containerStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }

    func configure(with movie: Movie) {
        titleLabel.text = movie.title
        releaseDateLabel.text = "\(DateFormatterHelper.shared.formatToYear(from: movie.releaseDate))"

        if let posterPath = movie.posterPath,
           let url = URL(string: "https://image.tmdb.org/t/p/w200\(posterPath)") {
            loadImage(from: url)
        } else {
            movieImageView.image = UIImage(named: "placeholder") // Use a placeholder image
        }
    }

    private func loadImage(from url: URL) {
        // Simple image loading without caching
        URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
            if let data = data,
               let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self?.movieImageView.image = image
                }
            }
        }.resume()
    }
}
