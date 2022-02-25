//
//  AppCoordiantor.swift
//  Elad'sproject
//
//  Created by elad schwartz on 25/02/2022.
//

import UIKit

class AppCoordinator : Coordinator
{
    private enum FlowType
    {
        case horizontal
        case vertical
    }
    
    private var navigationController = UINavigationController()
    
    var rootViewController : UIViewController
    {
        return navigationController
    }
    
    override func start()
    {
        showMainScreen()
    }
    
    private func showMainScreen()
    {
        let mainViewController = MainViewController.instantiate()
        navigationController.pushViewController(mainViewController, animated: true)
    }
}
