//
//  DeepLinkCoordinator.swift
//  photo-app
//
//  Created by Marco Agizza on 18/09/23.
//

import Foundation

class DeepLinkCoordinator: DeepLinkBaseCoordinator {
    
    var parentCoordinator: MainBaseCoordinator?
    
    init(mainBaseCoordinator: MainBaseCoordinator) {
        self.parentCoordinator = mainBaseCoordinator
    }
}
