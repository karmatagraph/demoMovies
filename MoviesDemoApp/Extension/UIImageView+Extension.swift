//
//  UIImageView+Extension.swift
//  MoviesDemoApp
//
//  Created by karma on 9/21/22.
//

import Foundation
import Kingfisher

extension UIImageView {
    
    func setImage(urlString: String?, placeHolderImage: UIImage? = UIImage(named: "placeholder_image"), completion: ((UIImage?)->())? = nil) {
        kf.indicatorType = .activity
        
        if let urlString = urlString,
           let encodedURLString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
           let url = URL(string: encodedURLString) {
            
            self.kf.setImage(with: url) { (imageResult) in
                switch imageResult {
                case .success(let imageResult):
                    completion?(imageResult.image)
                case .failure:
                    self.image = placeHolderImage
                }
            }
            
        } else {
            image = placeHolderImage
        }
    }
    
}
