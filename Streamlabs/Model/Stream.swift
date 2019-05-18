//
//  Stream.swift
//  Streamlabs
//
//  Created by Fernando Gallo on 17/05/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import Foundation
import ObjectMapper

struct Stream: Mappable {
    
    var id: String?
    var userId: String?
    var userName: String?
    var gameId: String?
    var title: String?
    var viewerCount: Int?
    var thumbnailUrl: String?
    var user: User?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        userId <- map["user_id"]
        userName <- map["user_name"]
        gameId <- map["game_id"]
        title <- map["title"]
        viewerCount <- map["viewer_count"]
        thumbnailUrl <- map["thumbnail_url"]
    }
}


