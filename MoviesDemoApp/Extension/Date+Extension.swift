//
//  Date+Extension.swift
//  MoviesDemoApp
//
//  Created by karma on 9/21/22.
//

import Foundation

enum SupportedFormat: String {
    case yyyyMMddDash = "yyyy-MM-dd"
    case yyyy = "yyyy"
    
    var identifier: String {
        return self.rawValue
    }
}

extension String {
    
    func toDate(format: SupportedFormat = .yyyyMMddDash) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format.identifier
        return formatter.date(from: self)
    }
    
}

extension Date {

    func toString(format: SupportedFormat = .yyyy) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format.identifier
        return formatter.string(from: self)
    }
    
}
