//
//  TwitchAPI.swift
//  Streamlabs
//
//  Created by Fernando Gallo on 17/05/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import Foundation
import Moya

let twitchBaseURL = URL(string: Constants.TwitchAPI.endpoint)!

enum TwitchAPI {
    case getClips()
    case getStreams()
    case getUsers(ids: [String])
}

extension TwitchAPI: TargetType {
    
    var baseURL: URL {
        return twitchBaseURL
    }
    
    var path: String {
        switch self {
        case .getClips:
            return "/clips"
        case .getStreams:
            return "/streams"
        case .getUsers:
            return "/users"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getClips,
             .getStreams,
             .getUsers:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .getClips:
            return .requestParameters(parameters: ["broadcaster_id" : "19571641"], encoding: URLEncoding.default)
        case .getStreams:
            return .requestParameters(parameters: [:], encoding: URLEncoding.default)
        case .getUsers(let ids):
            return .requestParameters(parameters: ["id" : ids], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return ["Client-ID" : Constants.TwitchAPI.clientId]
    }
    
}

let TwitchProvider = MoyaProvider<TwitchAPI>(plugins:
    [NetworkLoggerPlugin(verbose: true, responseDataFormatter: JSONResponseDataFormatter)])

func url(_ route: TargetType) -> String {
    return route.baseURL.appendingPathComponent(route.path).absoluteString
}

func JSONResponseDataFormatter(_ data: Data) -> Data {
    do {
        let dataAsJSON = try JSONSerialization.jsonObject(with: data)
        let prettyData =  try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
        return prettyData
    } catch {
        return data // fallback to original data if it can't be serialized.
    }
}
