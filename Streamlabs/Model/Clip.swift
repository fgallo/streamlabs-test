//
//  Clip.swift
//  Streamlabs
//
//  Created by Fernando Gallo on 17/05/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import Foundation
import ObjectMapper

struct Clip: Mappable {
    
    var id: String?
    var gameId: String?
    var videoId: String?
    var createdAt: String?
    var title: String?
    var viewCount: Int?
    var broadcasterName: String?
    var creatorName: String?
    var url: String?
    var thumbnailUrl: String?
    var embedUrl: String?
    
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        gameId <- map["game_id"]
        videoId <- map["video_id"]
        createdAt <- map["created_at"]
        title <- map["title"]
        viewCount <- map["view_count"]
        broadcasterName <- map["broadcaster_name"]
        creatorName <- map["creator_name"]
        url <- map["url"]
        thumbnailUrl <- map["thumbnail_url"]
        embedUrl <- map["embed_url"]
    }
    
    func createdAtDate() -> Date? {
        if let dateString = createdAt {
            let format = DateFormatter()
            format.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            return format.date(from: dateString)
        }
        
        return nil
    }
    
}
