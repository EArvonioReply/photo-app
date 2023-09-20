//
//  PhotosCoordinator.swift
//  photo-app
//
//  Created by Marco Agizza on 18/09/23.
//

import UIKit

class PhotosCoordinator: Coordinator {
    var parentCoordinator: MainBaseCoordinator?
    lazy var rootViewController: UIViewController = UIViewController()
    
    func start() -> UIViewController {
        rootViewController = UINavigationController(rootViewController: PhotosViewController(coordinator: self))
        return rootViewController
    }
    
    func moveTo(flow: AppFlow, userData: [String : Any]? = nil) {
        switch flow {
        case .photos(let screen):
            handlePhotosFlow(for: screen, userData: userData)
        default:
            parentCoordinator?.moveTo(flow: flow, userData: userData)
        }
    }
    
    private func handlePhotosFlow(for screen: PhotosScreen, userData: [String: Any]?) {
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

