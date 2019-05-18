//
//  Int.swift
//  Streamlabs
//
//  Created by Fernando Gallo on 17/05/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import Foundation

extension Int {
    
    func formatIntToString() -> String {
        let num = abs(Double(self))
        let sign = (self < 0) ? "-" : ""
        
        switch num {
            
        case 1_000_000_000...:
            var formatted = num / 1_000_000_000
            formatted = formatted.truncate(places: 1)
            return "\(sign)\(formatted)B"
            
        case 1_000_000...:
            var formatted = num / 1_000_000
            formatted = formatted.truncate(places: 1)
            return "\(sign)\(formatted)M"
            
        case 1_000...:
            var formatted = num / 1_000
            formatted = formatted.truncate(places: 1)
            return "\(sign)\(formatted)K"
            
        case 0...:
            return "\(self)"
            
        default:
            return "\(sign)\(self)"
            
        }
    }
    
}
