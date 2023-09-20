//
//  StatsCoordinator.swift
//  photo-app
//
//  Created by Marco Agizza on 18/09/23.
//

import UIKit

class StatsCoordinator: Coordinator {
    var parentCoordinator: MainBaseCoordinator?
    lazy var rootViewController: UIViewController = UIViewController()
    
    func start() -> UIViewController {
        rootViewController = UINavigationController(rootViewController: StatsViewController(coordinator: self))
        return rootViewController
    }
    
    func moveTo(flow: AppFlow, userData: [String : Any]? = nil) {
        switch flow {
        case .stats(let screen):
            handleStatsFlow(for: screen, userData: userData)
        default:
            parentCoordinator?.moveTo(flow: flow, userData: userData)
        }
    }
    
    private func handleStatsFlow(for screen: StatsScreen, userData: [String: Any]?) {
        switch screen {
        case .firstScreen:
            navigationRootViewController?.popToRootViewController(animated: true)
        }
    }
    
    func resetToRoot() -> Self {
        navigationRootViewController?.popToRootViewController(animated: false)
        return self
    }
}
