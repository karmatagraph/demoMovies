//
//  MovieDetailViewController.swift
//  MoviesDemoApp
//
//  Created by karma on 9/21/22.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    // MARK: - Properties
    var movie: Movie?
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        print(movie?.title)
    }
    
    // MARK: - Private Methods
    private func setup() {
        title = movie?.originalTitle
    }
    

}
