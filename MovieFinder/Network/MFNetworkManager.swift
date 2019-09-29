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
    
    func getPopular() -> Single<[Movie]> {
        return provider.rx
            .request(.getPopular)
            .filterSuccessfulStatusCodes()
            .map { res in
                try JSONDecoder().decode([Movie].self, from: res.data)
        }
    }
}
