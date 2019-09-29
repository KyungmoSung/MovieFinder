//
//  Credit.swift
//  CultureStore
//
//  Created by admin on 10/12/2018.
//  Copyright © 2018 admin. All rights reserved.
//

class Credit: Codable {
    let id: Int!
    let cast: [Cast]!
    let crew: [Crew]!
    var director: Crew?
}

class Cast: People {
    let castId: Int?
    let creditId: String!
    let character: String!
    let order: Int!

    private enum CodingKeys : String, CodingKey{
        case castId = "cast_id"
        case creditId = "credit_id"
        case character
        case order
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        castId = try container.decode(Int.self, forKey: .castId)
        creditId = try container.decode(String.self, forKey: .creditId)
        character = try container.decode(String.self, forKey: .character)
        order = try container.decode(Int.self, forKey: .order)
        
        try super.init(from: decoder)
    }
}

class Crew: People {
    var creditId: String!
    var department: String!
    var job: String!

    private enum CodingKeys : String, CodingKey{
        case creditId = "credit_id"
        case department
        case job
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        creditId = try container.decode(String.self, forKey: .creditId)
        department = try container.decode(String.self, forKey: .department)
        job = try container.decode(String.self, forKey: .job)
        
        try super.init(from: decoder)
    }
}
