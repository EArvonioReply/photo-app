//
//  FlickrPhoto.swift
//  photo-app
//
//  Created by Marco Agizza on 20/09/23.
//

import Foundation

struct FlickrPhoto: Decodable {
    let id: String
    let secret: String
    let server: String
    let farm: Int
    
    var photoUrl: String {
        "https://farm\(farm).staticflickr.com/\(server)/\(id)_\(secret)_m.jpg"
    }
}
