//
//  MainBaseCoordinator.swift
//  photo-app
//
//  Created by Marco Agizza on 18/09/23.
//

import Foundation

protocol MainBaseCoordinator: Coordinator {
    /// Reference to the PhotosCoordinator
    var photosCoordinator: PhotosBaseCoordinator { get }
    /// Reference to the StatsCoordinator
    var statsCoordinator: StatsBaseCoordinator { get }
    /// Object that contains the reference to the parent coordinator
    var deepLinkCoordinator: DeepLinkBaseCoordinator { get }
}

protocol PhotosBaseCoordinated {
    /// Associated coordinator for the photos flow
    var coordinator: PhotosBaseCoordinator? { get }
}

protocol StatsBaseCoordinated {
    /// Associated coordinator for the stats flow
    var coordinator: StatsBaseCoordinator? { get }
}
