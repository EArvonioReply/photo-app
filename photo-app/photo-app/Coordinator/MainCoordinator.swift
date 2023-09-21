//
//  MainCoordinator.swift
//  photo-app
//
//  Created by Marco Agizza on 18/09/23.
//

import UIKit

/// The possible app flows
enum AppFlow {
    case photos(PhotosScreen)
    case stats(StatsScreen)
}

/// The screens of the Photos flow
enum PhotosScreen {
    case firstScreen
    // here can be added other screens of the flow
}

/// The screens of the Stats flow
enum StatsScreen {
    case firstScreen
}

class MainCoordinator: MainBaseCoordinator {
    var parentCoordinator: MainBaseCoordinator?
    lazy var coordinators = [Coordinator]()
    lazy var rootViewController: UIViewController  = UITabBarController()
    
    init() {
        coordinators.append(PhotosCoordinator())
        coordinators.append(StatsCoordinator())
    }
    
    func start() -> UIViewController {
        
        let photosViewController = coordinators[0].start()
        coordinators[0].parentCoordinator = self
        photosViewController.tabBarItem = UITabBarItem(title: "Photos", image: UIImage(systemName: "photo.fill.on.rectangle.fill"), tag: 0)
        
        let statsViewController = coordinators[1].start()
        coordinators[1].parentCoordinator = self
        statsViewController.tabBarItem = UITabBarItem(title: "Stats", image: UIImage(systemName: "percent"), tag: 1)
        
        (rootViewController as? UITabBarController)?.viewControllers = [photosViewController, statsViewController]
        
        return rootViewController
    }
        
    func moveTo(flow: AppFlow, userData: [String : Any]?) {
        switch flow {
        case .photos:
            goToPhotosFlow(flow)
        case .stats:
            goToStatsFlow(flow)
        }
    }
    
    private func goToStatsFlow(_ flow: AppFlow) {
        coordinators[1].moveTo(flow: flow, userData: nil)
        (rootViewController as? UITabBarController)?.selectedIndex = 1
        
    }
    
    private func goToPhotosFlow(_ flow: AppFlow) {
        coordinators[0].moveTo(flow: flow, userData: nil)
        (rootViewController as? UITabBarController)?.selectedIndex = 0
        
    }
    
    func resetToRoot() -> Self {
        _ = coordinators[0].resetToRoot(animated: false)
        moveTo(flow: .photos(.firstScreen), userData: nil)
        return self
    }
    
}

