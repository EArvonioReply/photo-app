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
    
    func loadData(completion: @escaping () -> Void) {
        APIHandler.sharedInstance.fetchingAPIPhotos { apiData in
            apiData.photosList.forEach { photo in
                self.photos.append(Photo(url: "https://farm\(photo.farm).staticflickr.com/\(photo.server)/\(photo.id)_\(photo.secret)_m.jpg"))
            }
            completion()
        }
    }
    
    var numberOfPhotos: Int {
        return photos.count
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
