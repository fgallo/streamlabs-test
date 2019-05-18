//
//  UIColor.swift
//  Streamlabs
//
//  Created by Fernando Gallo on 17/05/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import UIKit

extension UIColor {
    
    static func random() -> UIColor {
        return UIColor(red:   .random(),
                       green: .random(),
                       blue:  .random(),
                       alpha: 1.0)
    }
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0,
                  green: CGFloat(green) / 255.0,
                  blue: CGFloat(blue) / 255.0,
                  alpha: 1.0)
    }
    
    convenience init(hex: Int) {
        self.init(red: (hex >> 16) & 0xff, green: (hex >> 8) & 0xff, blue: hex & 0xff)
    }
    
}

extension UIColor {
    struct StreamlabsColor {
        
        struct Violet {
            static let BottomBackground = UIColor(hex: 0x8D6BF0)
        }
        
        struct Orange {
            static let TopBackground = UIColor(hex: 0xF4AA62)
            static let Star = UIColor(hex: 0xFFB054)
        }

        struct Gray {
            static let DefaultBackground = UIColor(hex: 0x17242D)
            static let TabBar = UIColor(hex: 0xB0B5B7)
            static let StreamOnline = UIColor(hex: 0xB0B5B7)
            static let StreamOffline = UIColor(hex: 0x4A5960)
        }
    }
    
}
