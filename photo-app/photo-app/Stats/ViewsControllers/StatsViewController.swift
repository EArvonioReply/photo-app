//
//  StatsViewController.swift
//  photo-app
//
//  Created by Marco Agizza on 18/09/23.
//

import UIKit

class StatsViewController: UIViewController, StatsBaseCoordinated {

    var coordinator: StatsBaseCoordinator?
    
    init(coordinator: StatsBaseCoordinator) {
        super.init(nibName: nil, bundle: nil)
        self.coordinator = coordinator
        title = "Stats"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // self.view.backgroundColor = .orange
    }

}
