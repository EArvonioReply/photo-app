//
//  StatsViewController.swift
//  photo-app
//
//  Created by Marco Agizza on 18/09/23.
//

import UIKit

class StatsViewController: UIViewController, Coordinated {
    
    @IBOutlet weak var numberOfPhotos: UILabel!
    @IBOutlet weak var numberOfLikedPhotos: UILabel!
    @IBOutlet weak var numberOfDislikedPhotos: UILabel!
    
    var photosViewModel: PhotosViewControllerViewModel
    var coordinator: Coordinator?
    
    init(coordinator: Coordinator, photosViewModel: PhotosViewControllerViewModel) {
        self.coordinator = coordinator
        self.photosViewModel = photosViewModel
        super.init(nibName: nil, bundle: nil)
        title = "Stats"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        updateStats()
    }
    
    private func updateStats() {
        numberOfPhotos.text = photosViewModel.visiblePhotos.description
        numberOfLikedPhotos.text = photosViewModel.numberOfLike.description
        numberOfDislikedPhotos.text = photosViewModel.numberOfDislike.description
    }

}
