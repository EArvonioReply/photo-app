//
//  PhotosViewControllerViewModel.swift
//  photo-app
//
//  Created by Marco Agizza on 20/09/23.
//

import Foundation
import UIKit

class PhotosViewControllerViewModel {
    var photos = [Photo]()
    
    var numberOfPhotos: Int {
        return photos.count
    }
    
    var visiblePhotos = 0
    
    // It could be a simple var updated every time a like button is pressed
    var numberOfLike: Int {
        var count = 0
        photos.forEach { photo in
            if photo.reaction == .like {
                count += 1
            }
        }
        return count
    }
    
    // It could be a simple var updated every time a dislike button is pressed
    var numberOfDislike: Int {
        var count = 0
        photos.forEach { photo in
            if photo.reaction == .dislike {
                count += 1
            }
        }
        return count
    }
    
    func loadData(handler: @escaping () -> Void) {
        APIHandler.sharedInstance.fetchingAPIPhotos { apiData in
            apiData.photosList.forEach { photo in
                self.photos.append(Photo(url: "https://farm\(photo.farm).staticflickr.com/\(photo.server)/\(photo.id)_\(photo.secret)_m.jpg"))
            }
            handler()
        }
    }
    
    func printPhotos() {
        print("printing all photos")
        photos.forEach { photo in
            print("\(photo.id) with \(photo.reaction)")
        }
        print("finishing printing all photos")
    }
    
    func getPhoto(at position: Int) -> Photo {
        return photos[position]
    }
    
}
