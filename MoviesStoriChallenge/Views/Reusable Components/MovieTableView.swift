//
//  MovieTableView.swift
//  MoviesStoriChallenge
//
//  Created by Gustavo Isaac Lopez Nunez on 23/10/24.
//

import SwiftUI

struct MovieTableView: UIViewRepresentable {
    @Binding var movies: [Movie]
    var onReachedEnd: () -> Void
    var onSelectMovie: (Movie) -> Void

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> UIView {
        let containerView = UIView()

        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = context.coordinator
        tableView.delegate = context.coordinator
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: "MovieCell")
        tableView.backgroundColor = .white
        tableView.layer.cornerRadius = 15
        
        containerView.addSubview(tableView)

        // Set up constraints for tableView to fill the containerView
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: containerView.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])

        return containerView
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        if let tableView = uiView.subviews.first as? UITableView {
            // Reload data on the main thread
            DispatchQueue.main.async {
                tableView.reloadData()
            }
        }
    }

    class Coordinator: NSObject, UITableViewDataSource, UITableViewDelegate {
        var parent: MovieTableView

        init(_ parent: MovieTableView) {
            self.parent = parent
        }

        // UITableViewDataSource Methods
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return parent.movies.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as? MovieTableViewCell else {
                return UITableViewCell()
            }
            let movie = parent.movies[indexPath.row]
            cell.contentView.backgroundColor = .green200
            cell.configure(with: movie)
            return cell
        }

        // UITableViewDelegate Methods
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let movie = parent.movies[indexPath.row]
            parent.onSelectMovie(movie)
        }

        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let offsetY = scrollView.contentOffset.y
            let contentHeight = scrollView.contentSize.height

            if offsetY > contentHeight - scrollView.frame.height {
                parent.onReachedEnd()
            }
        }
    }
}
