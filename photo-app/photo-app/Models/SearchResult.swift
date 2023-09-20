//
//  SearchResult.swift
//  photo-app
//
//  Created by Marco Agizza on 20/09/23.
//

import Foundation

struct SearchResult: Decodable {
    let photosList: [FlickrPhoto]
    let status: String
    
    enum CodingKeys: String, CodingKey {
        case photos
        case photosList = "photo"
        case status = "stat"
    }
    
    init(from decoder: Decoder) throws {
        let contatiner = try decoder.container(keyedBy: CodingKeys.self)
        let photos = try contatiner.nestedContainer(keyedBy: CodingKeys.self, forKey: .photos)
        
        photosList = try photos.decode([FlickrPhoto].self, forKey: .photosList)
        status = try contatiner.decode(String.self, forKey: .status)
    }
}
