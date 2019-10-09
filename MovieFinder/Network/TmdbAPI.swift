//
//  TmdbAPI.swift
//  MovieFinder
//
//  Created by Kyungmo on 2019/09/29.
//  Copyright © 2019 Kyungmo. All rights reserved.
//

import RxSwift
import Moya

enum TmdbAPI {
    case getDetails(_ movieId: Int)
    case getCredits(_ movieId: Int)
    case getSimilarMovies(_ movieId: Int)
    case getVideos(_ movieId: Int)
    
    case getPopular(page: Int)
    case getTopRated
    case getNowPlaying
    case getUpcoming
    case searchMovies
}

extension TmdbAPI: TargetType {
    var baseURL: URL {
        return URL(string: AppURL.Tmdb.api)!
    }
    
    var method: Moya.Method {
        switch self {
        default:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getDetails(let movieId):
            return "/movie/\(movieId)"
        case .getCredits(let movieId):
            return "/movie/\(movieId)/credits"
        case .getSimilarMovies(let movieId):
            return "/movie/\(movieId)/similar"
        case .getVideos(let movieId):
            return "/movie/\(movieId)/videos"
        case .getPopular(_):
            return "/movie/popular"
        case .getTopRated:
            return "/movie/top_rated"
        case .getUpcoming:
            return "/movie/upcoming"
        case .getNowPlaying:
            return "/movie/now_playing"
        case .searchMovies:
            return"/search/movie"
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .getPopular(let page):
            let param: [String: Any] = [
                "api_key": AppKey.tmdbApi,
                "language": "ko",
                "page": page
            ]
            return .requestParameters(parameters: param, encoding: URLEncoding.default)
        default:
            return .requestPlain
        }
    }
    
    var validationType: ValidationType {
        return .successCodes
    }
}
