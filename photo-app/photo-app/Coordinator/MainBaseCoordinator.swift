//
//  MainBaseCoordinator.swift
//  photo-app
//
//  Created by Marco Agizza on 18/09/23.
//

import Foundation

protocol MainBaseCoordinator: Coordinator {
    /// List containing the references to the son coordinators
    var coordinators: [Coordinator] {get}
}

protocol Coordinated {
    /// Associated coordinator for the flow management
    var coordinator: Coordinator? { get }
}
