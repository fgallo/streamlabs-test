//
//  MainViewModel.swift
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

class MainViewModel {
    
    private let twitchProvider: MoyaProvider<TwitchAPI>
    private var clips: [Clip]
    
    init(twitchProvider: MoyaProvider<TwitchAPI>) {
        self.twitchProvider = twitchProvider
        self.clips = []
    }
    
    func fetchClips() -> Driver<[Clip]> {
        return twitchProvider.rx
            .request(TwitchAPI.getClips())
            .mapArray(Clip.self, atKeyPath: "data")
            .do(onSuccess: { clips in
                self.clips = clips
            })
            .asDriver(onErrorDriveWith: Driver<[Clip]>.empty())
    }
    
}
