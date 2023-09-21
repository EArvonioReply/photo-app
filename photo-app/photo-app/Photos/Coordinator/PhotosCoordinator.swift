//
//  PhotosCoordinator.swift
//  photo-app
//
//  Created by Marco Agizza on 18/09/23.
//

import UIKit

class PhotosCoordinator: Coordinator {
    var photosViewModel: PhotosViewControllerViewModel
    var parentCoordinator: MainBaseCoordinator?
    lazy var rootViewController: UIViewController = UIViewController()
    
    init(photosViewModel: PhotosViewControllerViewModel) {
        self.photosViewModel = photosViewModel
    }
    
    func start() -> UIViewController {
        rootViewController = UINavigationController(rootViewController:
                                                        PhotosViewController(coordinator: self, photosViewModel: photosViewModel)
                                                    )
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

