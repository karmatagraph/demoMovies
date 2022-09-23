//
//  Double+Extension.swift
//  MoviesDemoApp
//
//  Created by karma on 9/24/22.
//

import Foundation

extension Double {
    func round(to places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
