//
//  Coordinator.swift
//  Elad'sproject
//
//  Created by elad schwartz on 25/02/2022.
//

import UIKit

protocol CoordinatorDelegate : AnyObject
{
    func didFinish() -> Coordinator?
}

class Coordinator: NSObject, UINavigationControllerDelegate
{
    // MARK: - Properties
    weak var delegate : CoordinatorDelegate?
    
    var childCoordinators: [Coordinator] = []

    // MARK: - Methods
    
    func start() {}
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {}
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {}

    // MARK: -
    
    func pushCoordinator(_ coordinator: Coordinator)
    {
        // Start Coordinator
        coordinator.start()
        
        // Append to Child Coordinators
        childCoordinators.append(coordinator)
    }
    
    func popCoordinator(_ coordinator: Coordinator)
    {
        // Remove Coordinator From Child Coordinators
        if let index = childCoordinators.firstIndex(where: { $0 === coordinator }) {
            childCoordinators.remove(at: index)
        }
    }
}
