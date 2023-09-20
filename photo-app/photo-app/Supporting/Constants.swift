//
//  Constants.swift
//  photo-app
//
//  Created by Marco Agizza on 20/09/23.
//

import Foundation

struct Constants {
    // MARK: API
    static let scheme = "https"
    static let baseURL = "api.flickr.com"
    static let port: Int? = nil
    static let fullURL = "https://api.flickr.com/"
    
    private static let wordList = ["casa", "albero", "macchina", "gatto", "tavolo", "libro", "computer", "montagna"]
    static let API_KEY = "c10b359598e65b6998a2dd0505b7dd34"
    static let METHOD = "flickr.photos.search"
    static var searchKey: String {
        let randomIndex = Int.random(in: 0..<wordList.count)
        return wordList[randomIndex]
    }
    static let NUMBER_OF_RESULTS = 20
    static let RESPONSE_FORMAT = "json"
}
