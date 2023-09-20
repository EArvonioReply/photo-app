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
    
    var coordinator: Coordinator?
    
    init(coordinator: Coordinator) {
        super.init(nibName: nil, bundle: nil)
        self.coordinator = coordinator
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
        
    }

}
