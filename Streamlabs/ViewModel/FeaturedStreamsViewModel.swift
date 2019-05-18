//
//  FeaturedStreamsViewModel.swift
//  Streamlabs
//
//  Created by Fernando Gallo on 17/05/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import Foundation
import Moya
import RxCocoa
import RxSwift
import Moya_ObjectMapper

class FeaturedStreamsViewModel {
    
    private let twitchProvider: MoyaProvider<TwitchAPI>
    private var streams: [Stream]
    
    init(twitchProvider: MoyaProvider<TwitchAPI>) {
        self.twitchProvider = twitchProvider
        self.streams = []
    }
    
    // MARK: - API
    
    func fetchFeaturedStreams() -> Driver<[Stream]> {
        return twitchProvider.rx
            .request(TwitchAPI.getStreams())
            .mapArray(Stream.self, atKeyPath: "data")
            .do(onSuccess: { streams in
                self.streams = streams
            })
            .asDriver(onErrorDriveWith: Driver<[Stream]>.empty())
    }
    
    func fetchUsers() -> Driver<[User]> {
        let ids = streams.map { stream -> String in
            return stream.userId ?? ""
        }
        
        return twitchProvider.rx
            .request(TwitchAPI.getUsers(ids: ids))
            .mapArray(User.self, atKeyPath: "data")
            .do(onSuccess: { users in
                for i in 0..<users.count {
                    self.streams[i].user = users[i]
                }
            })
            .asDriver(onErrorDriveWith: Driver<[User]>.empty())
    }
    
    
    // MARK: - Streams
    
    func numberOfStreams() -> Int {
        return streams.count
    }
    
    func streamForItemAt(indexPath: IndexPath) -> Stream {
        return streams[indexPath.row]
    }
    
}
