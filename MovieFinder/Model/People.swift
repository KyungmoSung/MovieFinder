//
//  People.swift
//  CultureStore
//
//  Created by admin on 10/12/2018.
//  Copyright © 2018 admin. All rights reserved.
//

class People: Codable {
    let birthday: String?
    let deathday: String?
    let id: Int!
    let name: String!
    let gender: Int?
    let biography: String!
    let popularity: Double!
    let adult: Bool!
    let homepage: String?
    let knownForDepartment: String!
    let alsoKnownAs: [String]!
    let placeOfBirth: String?
    let profilePath: String?
    let imdbId: String!
    
    private enum CodingKeys : String, CodingKey{
        case birthday
        case deathday
        case id
        case name
        case gender
        case biography
        case popularity
        case adult
        case homepage
        case knownForDepartment = "known_for_department"
        case alsoKnownAs = "also_known_as"
        case placeOfBirth = "place_of_birth"
        case profilePath = "profile_path"
        case imdbId = "imdb_id"
    }
}
