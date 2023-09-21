//
//  PhotosViewController.swift
//  photo-app
//
//  Created by Marco Agizza on 18/09/23.
//

import UIKit

// MARK: - PhotosViewController

class PhotosViewController: UIViewController, Coordinated {
    
    // MARK: - IBOutlet Properties
    
    @IBOutlet weak var photosTableView: UITableView!
    
    // MARK: - Coordinated Property
    
    var coordinator: Coordinator?
    
    // MARK: - Private Properties
    
    private var viewModel: PhotosViewControllerViewModel
    
    // MARK: - PhotosViewController Init Method
    
    init(coordinator: Coordinator, viewModel: PhotosViewControllerViewModel) {
        
        self.coordinator = coordinator
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
        
        title = "Photos"
        
        viewModel.loadData { [weak self] in
            self?.photosTableView.reloadData()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UIViewController Life Cycle Method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photosTableView.register(UINib(nibName: "PhotosTableViewCell", bundle: nil), forCellReuseIdentifier: "PhotosTableViewCell")
        photosTableView.delegate = self
        photosTableView.dataSource = self
        
    }

}

// MARK: - UITableViewDelegate & UITableViewDataSource Extension

extension PhotosViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfPhotos
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PhotosTableViewCell", for: indexPath) as? PhotosTableViewCell else {
            fatalError("Unable to dequeue PhotosTableViewCell in PhotosViewController")
        }

        cell.configure(by: PhotosTableViewCellViewModel(photo: viewModel.getPhoto(at: indexPath.row)))
        cell.delegate = self
        return cell
    }
}

// MARK: - PhotosTableViewCellDelegate

extension PhotosViewController: PhotosTableViewCellDelegate {
    func photosTableViewCell(_ photosTableViewCell: PhotosTableViewCell, update photo: Photo) {
        guard let indexPath = photosTableView.indexPath(for: photosTableViewCell) else { return }
        viewModel.update(photo: photo, at: indexPath.row)
        photosTableView.reloadRows(at: [indexPath], with: .none)
    }
}
