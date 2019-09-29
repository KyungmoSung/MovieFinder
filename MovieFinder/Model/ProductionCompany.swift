//
//  ProductionCompany.swift
//  CultureStore
//
//  Created by admin on 07/12/2018.
//  Copyright © 2018 admin. All rights reserved.
//

class ProductionCompany: Codable {
    let name: String!
    let id: Int!
    let logoPath: String?
    let originCountry: String!

    enum CodingKeys : String, CodingKey{
        case name
        case id
        case logoPath = "logo_path"
        case originCountry = "origin_country"
    }
}
