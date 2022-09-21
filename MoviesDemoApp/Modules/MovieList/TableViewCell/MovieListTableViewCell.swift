//
//  MovieListTableViewCell.swift
//  MoviesDemoApp
//
//  Created by karma on 9/21/22.
//

import UIKit

class MovieListTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var releaseDateLbl: UILabel!
    
    // MARK: - Methods
    func configure(with movie: Movie) {
        titleLbl.text = movie.originalTitle
        releaseDateLbl.text = movie.releaseDate
//        imageView?.setImage(urlString: Constants.imageBaseUrl + movie.posterPath)
        imgView.kf.setImage(with: URL(string: Constants.imageBaseUrl + movie.posterPath))
    }
}
