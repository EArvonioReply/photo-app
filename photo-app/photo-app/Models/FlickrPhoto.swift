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
}
