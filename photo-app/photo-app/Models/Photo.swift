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
    let url: String
    var reaction: Reaction = .none 
    
    mutating func react(with react: Reaction) {
        reaction = react
    }
}

extension Photo {
    
    // DEBUG
    public static func getMockArray() -> [Photo] {
        return [
            Photo(url: "https://farm66.staticflickr.com/65535/53201202683_6f729a32c8_b.jpg"),
            Photo(url: "https://leganerd.com/wp-content/uploads/2017/10/Baby-Groot-999x562.jpg"),
            Photo(url: "https://hips.hearstapps.com/hmg-prod/images/1-1661422620.png"),
            Photo(url: "https://orgoglionerd.it/wp-content/uploads/2020/03/alpha-groot-Guardiani-della-Galassia.jpg"),
            Photo(url: "https://www.nerdevil.it/wp-content/uploads/2022/08/i-am-groot-nave.jpg"),
            Photo(url: "https://costumesheaven.b-cdn.net/wp-content/uploads/2022/11/Groot-Costume-featured.jpg"),
            Photo(url: "https://leganerd.com/wp-content/uploads/2021/02/maxresdefault.v1-e1614073359119.jpg"),
            Photo(url: "https://www.cinematographe.it/wp-content/uploads/2020/07/Dancing-Baby-Groot-Toys-2-1-1280x720.png")
        ]
    }
    
}
