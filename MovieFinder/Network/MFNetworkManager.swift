//
//  MFNetworkManager.swift
//  MovieFinder
//
//  Created by Kyungmo on 2019/09/29.
//  Copyright © 2019 Kyungmo. All rights reserved.
//

import RxSwift
import Moya

class MFNetworkManager {
    let provider = MoyaProvider<TmdbAPI>()
    
    func getPopular(page: Int) -> Single<[Movie]> {
        return provider.rx
            .request(.getPopular(page: page))
            .filterSuccessfulStatusCodes()
            .map{ try JSONDecoder().decode(Movie.self, from: $0.data) }
            .map{ $0.results! }
    }
}
