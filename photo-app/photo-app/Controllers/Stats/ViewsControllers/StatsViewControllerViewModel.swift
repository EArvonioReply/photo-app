//
//  StatsViewControllerViewModel.swift
//  photo-app
//
//  Created by utente on 21/09/23.
//

import Foundation

class StatsViewControllerViewModel {
    var photosNumber: Int {
        StatsHandler.shared.photos
    }
    
    var likesNumber: Int {
        StatsHandler.shared.likes
    }
    
    var dislikesNumber: Int {
        StatsHandler.shared.dislikes
    }
}
