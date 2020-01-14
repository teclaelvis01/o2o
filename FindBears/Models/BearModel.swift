//
//  Bear.swift
//  FindBears
//
//  Created by Elvis Reyes on 13/01/2020.
//  Copyright © 2020 Elvis Reyes. All rights reserved.
//

import Foundation

struct BearModel: Codable {
    var id : Int
    var name: String
    var tagline: String
    var first_brewed: String
    var description: String
    var image_url: String
    var abv: Float
    var ibu: Float?
    var target_fg: Int
    var target_og: Float?
    var ebc: Float?
    var srm: Float?
    var ph: Float?
    var attenuation_level: Float?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case tagline
        case first_brewed
        case description
        case image_url
        case abv
        case ibu
        case target_fg
        case target_og
        case ebc
        case srm
        case ph
        case attenuation_level
    }
    

}
