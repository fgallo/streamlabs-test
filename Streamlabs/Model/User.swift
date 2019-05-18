//
//  User.swift
//  Streamlabs
//
//  Created by Fernando Gallo on 17/05/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import Foundation
import ObjectMapper

struct User: Mappable {
    
    var id: String?
    var displayName: String?
    var profileImageUrl: String?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        displayName <- map["display_name"]
        profileImageUrl <- map["profile_image_url"]
    }
}
