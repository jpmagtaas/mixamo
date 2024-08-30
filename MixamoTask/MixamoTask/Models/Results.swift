//
//  Results.swift
//  MixamoTask
//
//  Created by Juan Paolo Magtaas on 10/7/22.
//

import Foundation

struct Results: Codable {
    let results: [Item]?
}

struct Item: Codable {
    let id: String?
    let type: String?
    let desc: String?
    let category: String?
    let characterType: String?
    let name: String?
    let thumbnail: String?
    let thumbnailAnimated: String?
    var isSaved: Bool = false
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case type = "type"
        case desc = "description"
        case category = "category"
        case characterType = "character_type"
        case name = "name"
        case thumbnail = "thumbnail"
        case thumbnailAnimated = "thumbnail_animated"
    }
}
