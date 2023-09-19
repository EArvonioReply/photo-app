//
//  PhotosViewController.swift
//  photo-app
//
//  Created by Marco Agizza on 18/09/23.
//

import UIKit

class PhotosViewController: UIViewController, PhotosBaseCoordinated {
    
    @IBOutlet weak var photosTableView: UITableView!
    
    var coordinator: PhotosBaseCoordinator?
    var numberOfPhotos = 10
    
    init(coordinator: PhotosBaseCoordinator) {
        super.init(nibName: nil, bundle: nil)
        
        self.coordinator = coordinator
        title = "Photos"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photosTableView.delegate = self
        photosTableView.dataSource = self
        
    }

}

extension PhotosViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: "Cell")
        return numberOfPhotos
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PhotosTableViewCell
        //cell.configure(by: Photo(picture: UIImage(systemName: "fireplace")!))
        
        // MARK: Emilio, perché sono stato costretto a usare il Bundle?
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "PhotosTableViewCell", bundle: bundle)
        if let photoCell = nib.instantiate(withOwner: self, options: nil)[0] as? PhotosTableViewCell {
            photoCell.configure(by: Photo(picture: UIImage(systemName: "fireplace")!))
            return photoCell
        }
        return cell
    }
    
    
}
