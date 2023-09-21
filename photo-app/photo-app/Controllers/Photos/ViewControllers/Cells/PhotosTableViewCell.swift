//
//  PhotosTableViewCell.swift
//  photo-app
//
//  Created by Marco Agizza on 19/09/23.
//

import UIKit
import Kingfisher

// MARK: - PhotosTableViewCellDelegate

protocol PhotosTableViewCellDelegate: AnyObject {
    func photosTableViewCell(_ photosTableViewCell: PhotosTableViewCell, update photo: Photo)
}


class PhotosTableViewCell: UITableViewCell {

    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var dislikeButton: UIButton!
    
    var viewModel: PhotosTableViewCellViewModel!
    weak var delegate: PhotosTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        picture.layer.cornerRadius = 10.0
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        picture.image = UIImage.Images.placeholder
    }
    
    @IBAction func buttonDidTap(_ sender: UIButton) {
        var photo = viewModel.photo
        if sender === likeButton {
            switch(viewModel.photo.reaction) {
            case .like:
                photo.reaction = .none
                StatsHandler.shared.update(
                    statistic: .likes,
                    with: StatsHandler.shared.likes - 1
                )
            case .dislike:
                photo.reaction = .like
                StatsHandler.shared.update(
                    statistic: .likes,
                    with: StatsHandler.shared.likes + 1
                )
            default:
                photo.reaction = .like
                StatsHandler.shared.update(
                    statistic: .likes,
                    with: StatsHandler.shared.likes + 1
                )
            }
        } else {
            switch(viewModel.photo.reaction) {
            case .like:
                photo.reaction = .dislike
                StatsHandler.shared.update(
                    statistic: .dislikes,
                    with: StatsHandler.shared.dislikes + 1
                )
            case .dislike:
                photo.reaction = .none
                StatsHandler.shared.update(
                    statistic: .dislikes,
                    with: StatsHandler.shared.dislikes - 1
                )
            default:
                photo.reaction = .dislike
                StatsHandler.shared.update(
                    statistic: .dislikes,
                    with: StatsHandler.shared.dislikes + 1
                )
            }
        }
        delegate?.photosTableViewCell(self, update: photo)
    }
    
    func configure(by viewModel: PhotosTableViewCellViewModel) {
        self.viewModel = viewModel
        picture.kf.setImage(with: URL(string: viewModel.photo.url), placeholder: UIImage.Images.placeholder)
        
        switch viewModel.photo.reaction {
        case .like:
            likeButton.setImage(.Images.thumbUpFill, for: .normal)
            dislikeButton.setImage(.Images.thumbDown, for: .normal)
        case .dislike:
            likeButton.setImage(.Images.thumbUp, for: .normal)
            dislikeButton.setImage(.Images.thumbDownFill, for: .normal)
        default:
            likeButton.setImage(.Images.thumbUp, for: .normal)
            dislikeButton.setImage(.Images.thumbDown, for: .normal)
        }
    }
    
}

// MARK: - ViewModel

struct PhotosTableViewCellViewModel {
    let photo: Photo
}
