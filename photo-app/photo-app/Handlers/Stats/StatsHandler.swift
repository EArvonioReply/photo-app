//
//  StatsHandler.swift
//  photo-app

import Foundation

class StatsHandler {
    
    // MARK: Internal Statistic Enum
    
    enum Statistic: String {
        case photos, likes, dislikes
    }
    
    // MARK: - Static Property
    
    static var shared: StatsHandler = StatsHandler()
    
    //MARK: - Private Properties
    
    private(set) var photos: Int = 0
    private(set) var likes: Int = 0
    private(set) var dislikes: Int = 0
    
    //MARK: - Public Method
    
    func update(statistic: Statistic, with value: Int) {
        switch statistic {
        case .photos:
            photos = value
        case .likes:
            likes = value
        case .dislikes:
            dislikes = value
        }
    }
}
