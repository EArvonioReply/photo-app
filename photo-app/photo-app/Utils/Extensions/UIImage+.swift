//
//  UIImage+.swift
//  photo-app
//
//  Created by utente on 21/09/23.
//

import UIKit

extension UIImage {
    enum Images {
        static var placeholder: UIImage? {
            UIImage(named: "placeholder")
        }
        
        static var thumbUp: UIImage? {
            UIImage(systemName: "hand.thumbsup")
        }
        
        static var thumbDown: UIImage? {
            UIImage(systemName: "hand.thumbsdown")
        }
        
        static var thumbUpFill: UIImage? {
            UIImage(systemName: "hand.thumbsup.fill")
        }
        
        static var thumbDownFill: UIImage? {
            UIImage(systemName: "hand.thumbsdown.fill")
        }
    }
}
