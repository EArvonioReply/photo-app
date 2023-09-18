//
//  Coordinator.swift
//  photo-app
//
//  Created by Marco Agizza on 18/09/23.
/*
 In order to better manage in the future the navigation at different depths of the flows that can be started starting by
 one of the two items of the Tab Bar, it's defined an architecture that involves three coordinator:
    *   One MainCoordinator associated to the RootView (UITabBarController)
    *   One PhotosCoordinator for the flow reachable from the Photos TabItem
    *   One StatsCoordinator for the flow reachable from the Stats TabItem
 The user will be able to jump from a flow to another just tapping on the TabItem and the navigation stack will be
 memorized.
 */

import UIKit

protocol FlowCoordinator: AnyObject {
    /// Reference to the parent coordinator (optional since the main coordinator doesn't have a parent
    var parentCoordinator: MainBaseCoordinator? { get set }
}

protocol Coordinator: FlowCoordinator {
    /// Reference to the associated `ViewController`.
    /// TabBarController for the MainCoordinator; Photos/Stats..ViewController for ../Coordinator
    var rootViewController: UIViewController { get set }
    
    /// `rootViewController` initializer
    func start() -> UIViewController
    /// Management of the movement form a flow to a flow or the restart of the same one.
    /// If `flow` is equal to the actual flow, the flow restarts form `rootViewController`
    /// - Parameters:
    ///     - `flow`: the destination navigation flow
    ///     - `userData`: dictionary of user datas that can be passed during the movement
    func moveTo(flow: AppFlow, userData: [String: Any]?)
    
    @discardableResult func resetToRoot(animated: Bool) -> Self
}

extension Coordinator {
    var navigationRootViewController: UINavigationController? {
        get { rootViewController as? UINavigationController }
    }
    
    func resetToRoot(animated: Bool) -> Self {
        navigationRootViewController?.popToRootViewController(animated: animated)
        return self
    }
}
