//
//  MovieListTableViewCell.swift
//  MoviesDemoApp
//
//  Created by karma on 9/21/22.
//

import UIKit

class MovieListTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var voteLbl: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var imgActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var releaseDateLbl: UILabel!
    
    // MARK: - Lifecycles
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setup()
    }
    
    // MARK: - Private Methods
    private func setup() {
        containerView.set(cornerRadius: (containerView.height/2)/4)
        containerView.setShadow()
    }
    
    // MARK: - Methods
    func configure(with movie: Movie) {
        titleLbl.text = movie.originalTitle
        titleLbl.textColor = .label
        releaseDateLbl.text = "Released on " + movie.releaseDate
        releaseDateLbl.textColor = .secondaryLabel
        voteLbl.text = "\(movie.voteAverage)"
//        imageView?.setImage(urlString: Constants.imageBaseUrl + movie.posterPath)
        imgView.kf.setImage(with: URL(string: Constants.imageBaseUrl + movie.posterPath))
        imgView.setupBorder(color: .systemYellow, radius:8 )
        imgView.set(cornerRadius: imgView.height/8)
        
    }
}
