//
//  Photo.swift
//  photo-app
//
//  Created by Marco Agizza on 19/09/23.
//

import UIKit

enum Reaction {
    case none
    case like
    case dislike
}

struct Photo: Identifiable {
    let id = UUID()
    let picture: UIImage
    var reaction: Reaction = .none
    
    mutating func react(with react: Reaction) {
        reaction = react
    }
}
