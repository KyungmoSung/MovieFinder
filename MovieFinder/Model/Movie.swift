//
//  Movie.swift
//  CultureStore
//
//  Created by admin on 22/11/2018.
//  Copyright © 2018 admin. All rights reserved.
//

class Movie: Codable {
    let page: Int?
    let results: [Movie]?
    let totalResults: Int?
    let totalPages: Int?
    
    let posterPath: String?
    let adult: Bool!
    let overview: String!
    let releaseDate: String!
    let genreIds: [Int]!
    let id: Int!
    let originalTitle: String!
    let originalLanguage: String!
    let spokenLanguages: [ISO]!
    let productionCountries: [ISO]!
    let productionCompanies: [ProductionCompany]!
    let title: String!
    let backdropPath: String?
    let popularity: Double!
    let voteCount: Int!
    let video: Bool!
    let voteAverage: Double!
    let genres: [Genre]!
    let runtime: Int?
    let revenue: Int!
    
    enum CodingKeys : String, CodingKey{
        case page
        case results
        case adult
        case overview
        case id
        case title
        case popularity
        case video
        case genres
        case runtime
        case revenue
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case genreIds = "genre_ids"
        case originalTitle = "original_title"
        case originalLanguage = "original_language"
        case spokenLanguages = "spoken_languages"
        case productionCountries = "production_countries"
        case productionCompanies = "production_companies"
        case backdropPath = "backdrop_path"
        case voteCount = "vote_count"
        case voteAverage = "vote_average"
    }
}

enum MovieCategory: String {
    case NowPlaying = "Now Playing"
    case Popular = "Popular"
    case TopRated = "Top Rated"
}


