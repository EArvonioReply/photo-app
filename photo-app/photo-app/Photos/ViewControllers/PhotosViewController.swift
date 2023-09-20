//
//  PhotosViewController.swift
//  photo-app
//
//  Created by Marco Agizza on 18/09/23.
//

import UIKit

class PhotosViewController: UIViewController, Coordinated {
    
    @IBOutlet weak var photosTableView: UITableView!
    
    var photosViewModel: PhotosViewControllerViewModel
    var coordinator: Coordinator? // Dovrebbe essere nel view model?
    
    init(coordinator: Coordinator, photosViewModel: PhotosViewControllerViewModel) {
        
        self.coordinator = coordinator
        self.photosViewModel = photosViewModel
        
        super.init(nibName: nil, bundle: nil)
        
        title = "Photos"
        
        photosViewModel.loadData { [weak self] in
            self?.photosTableView.reloadData()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photosTableView.register(UINib(nibName: "PhotosTableViewCell", bundle: nil), forCellReuseIdentifier: "PhotosTableViewCell")
        photosTableView.delegate = self
        photosTableView.dataSource = self
        
    }

}

extension PhotosViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photosViewModel.numberOfPhotos
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PhotosTableViewCell", for: indexPath) as? PhotosTableViewCell else {
            fatalError("Unable to dequeue PhotosTableViewCell in PhotosViewController")
        }
        
        cell.configure(by: photosViewModel, at: indexPath.row)
        return cell
    }
    
    
}
