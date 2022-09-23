//
//  MovieDetailViewController.swift
//  MoviesDemoApp
//
//  Created by karma on 9/21/22.
//

import UIKit
import Kingfisher

class MovieDetailViewController: UIViewController {
    
    // MARK: - Properties
    var movie: Movie?
    
    // MARK: - Outlets
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var genreLbl: UILabel!
    @IBOutlet weak var releaseDateLbl: UILabel!
    @IBOutlet weak var budgetLbl: UILabel!
    @IBOutlet weak var revenueLbl: UILabel!
    @IBOutlet weak var runtimeLbl: UILabel!
    @IBOutlet weak var statusLbl: UILabel!
    @IBOutlet weak var productionCompaniesLbl: UILabel!
    @IBOutlet weak var overviewLbl: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var coverView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Private Methods
    private func setup() {
        title = movie?.originalTitle
        fetchData()
        setupActivityIndicator()
    }
    
    private func fetchData() {
        guard let id = movie?.id else { return }
        NetworkManager.getApi(with: .movie(id), expecting: MovieDetail.self) { [ weak self ] result in
            switch result {
            case .success(let movieDetailModel):
                DispatchQueue.main.async {
                    self?.updateUI(with: movieDetailModel)
                    self?.activityIndicator.stopAnimating()
                    self?.coverView.fadeOut(duration: 3, delay: 0)
                }
            case .failure(let error):
                print("error fetching data:::\(error)")
            }
        }
    }
    
    private func setupActivityIndicator() {
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        coverView.isHidden = false
    }
    
    private func updateUI(with model: MovieDetail) {
        if model.originalTitle != model.title {
            titleLbl.text = "Title: \(model.title) (\(model.originalTitle))"
        } else {
            titleLbl.text = "Title: \(model.title)"
        }
        
        genreLbl.text = "Genre: \(model.genres.first?.name ?? "")"
        releaseDateLbl.text = "Release Date: \(model.releaseDate)"
        budgetLbl.text = "Budget: $ \(model.budget)"
        revenueLbl.text = "Revenue: $ \(model.revenue)"
        runtimeLbl.text = "Runtime: \(model.runtime) minutes"
        statusLbl.text = "Status: \(model.status)"
        productionCompaniesLbl.text = "Production Companies: \(model.productionCompanies.first?.name ?? "")"
        overviewLbl.text = " Overview: \(model.overview)"
        imgView.kf.setImage(with: URL(string:Constants.imageBaseUrl + model.posterPath))
    }
    
    

}
