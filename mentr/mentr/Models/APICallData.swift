//
//  APICallData.swift
//  mentr
//
//  Created by Wren Liang on 2019-11-30.
//  Copyright © 2019 Wren Liang. All rights reserved.
//

import Foundation

struct ServerPerson: Codable {
    let id: Int
    let firstName, lastName: String
    let year: Int
    let faculty: Faculty
    let major: String?
    let university: University
    let email, phone, facebook: String
    let interests: [String]
    let bio: String
}

enum Faculty: String, Codable {
    case arts = "Arts"
    case commerce = "Commerce"
    case engineering = "Engineering"
    case forestry = "Forestry"
    case landAndFoodSystems = "Land and Food Systems"
    case science = "Science"
}

enum University: String, Codable {
    case capilanoUniversity = "Capilano University"
    case simonFraserUniversity = "Simon Fraser University"
    case ubcOkanagan = "UBC Okanagan"
    case universityOfBritishColumbia = "University of British Columbia"
    case universityOfVictoria = "University of Victoria"
}

typealias People = [ServerPerson]
