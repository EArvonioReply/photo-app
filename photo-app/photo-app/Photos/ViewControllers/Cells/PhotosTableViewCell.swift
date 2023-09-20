//
//  PhotosTableViewCell.swift
//  photo-app
//
//  Created by Marco Agizza on 19/09/23.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {

    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var dislikeButton: UIButton!
    
    var photo: Photo?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }
    
    // Like button action
    @IBAction func thumbsUpButtonTapped(_ sender: UIButton) {
        switch(photo?.reaction) {
        case .like:
            likeButton.setImage(UIImage(systemName: "hand.thumbsup"), for: .normal)
            photo?.react(with: .none)
        case .dislike:
            dislikeButton.setImage(UIImage(systemName: "hand.thumbsdown"), for: .normal)
            likeButton.setImage(UIImage(systemName: "hand.thumbsup.fill"), for: .normal)
            photo?.react(with: .like)
        default:
            likeButton.setImage(UIImage(systemName: "hand.thumbsup.fill"), for: .normal)
            photo?.react(with: .like)
        }
    }
    
    // Dislike button action
    @IBAction func thumbsDownButtonTapped(_ sender: UIButton) {
        switch(photo?.reaction) {
        case .like:
            likeButton.setImage(UIImage(systemName: "hand.thumbsup"), for: .normal)
            dislikeButton.setImage(UIImage(systemName: "hand.thumbsdown.fill"), for: .normal)
            photo?.react(with: .dislike)
        case .dislike:
            dislikeButton.setImage(UIImage(systemName: "hand.thumbsdown"), for: .normal)
            photo?.react(with: .none)
        default:
            dislikeButton.setImage(UIImage(systemName: "hand.thumbsdown.fill"), for: .normal)
            photo?.react(with: .dislike)
        }
    }
    
    // Configuration of the cell through the field of a Photo object
    func configure(by photo: Photo) {
        self.photo = photo
        picture.image = photo.picture
        
    }
    
}
