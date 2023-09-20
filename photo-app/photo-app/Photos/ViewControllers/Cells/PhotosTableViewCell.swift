//
//  PhotosTableViewCell.swift
//  photo-app
//
//  Created by Marco Agizza on 19/09/23.
//

import UIKit
import Kingfisher

class PhotosTableViewCell: UITableViewCell {

    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var dislikeButton: UIButton!
    
    var photosViewModel: PhotosViewControllerViewModel!
    var indexPathRow: Int!
    
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
        switch(photosViewModel.photos[indexPathRow].reaction) {
        case .like:
            photosViewModel.photos[indexPathRow].react(with: .none)
        case .dislike:
            photosViewModel.photos[indexPathRow].react(with: .like)
        default:
            photosViewModel.photos[indexPathRow].react(with: .like)
        }
        restoreButtonsState(for: photosViewModel.photos[indexPathRow])
    }
    
    // Dislike button action
    @IBAction func thumbsDownButtonTapped(_ sender: UIButton) {
        switch(photosViewModel.photos[indexPathRow].reaction) {
        case .like:
            photosViewModel.photos[indexPathRow].react(with: .dislike)
        case .dislike:
            photosViewModel.photos[indexPathRow].react(with: .none)
        default:
            photosViewModel.photos[indexPathRow].react(with: .dislike)
        }
        restoreButtonsState(for: photosViewModel.photos[indexPathRow])
    }
    
    private func restoreButtonsState(for photo: Photo) {
        switch photo.reaction {
        case .like:
            likeButton.setImage(UIImage(systemName: "hand.thumbsup.fill"), for: .normal)
            dislikeButton.setImage(UIImage(systemName: "hand.thumbsdown"), for: .normal)
        case .dislike:
            likeButton.setImage(UIImage(systemName: "hand.thumbsup"), for: .normal)
            dislikeButton.setImage(UIImage(systemName: "hand.thumbsdown.fill"), for: .normal)
        default:
            likeButton.setImage(UIImage(systemName: "hand.thumbsup"), for: .normal)
            dislikeButton.setImage(UIImage(systemName: "hand.thumbsdown"), for: .normal)
        }
    }
    
    func configure(by vm: PhotosViewControllerViewModel, at index: Int) {
        photosViewModel = vm
        indexPathRow = index
        picture.layer.cornerRadius = 10.0
        picture.kf.setImage(with: URL(string: vm.photos[index].url), placeholder: UIImage(named: "placeholder"))
        restoreButtonsState(for: vm.photos[index])
    }
    
}
