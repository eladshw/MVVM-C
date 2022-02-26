//
//  MainCoordinator.swift
//  Elad'sproject
//
//  Created by elad schwartz on 26/02/2022.
//

import UIKit

class MainCoordinator : Coordinator
{
    let navigationController : UINavigationController
    
    init(navigationController : UINavigationController)
    {
        self.navigationController = navigationController
        navigationController.isNavigationBarHidden = true
    }
    
    override func start()
    {
        let mainViewController              = MainViewController.instantiate()
        let tableController                 = MainTableController()
        mainViewController.tableController  = tableController
        let viewModel                       = MainViewModel()
        tableController.delegate            = viewModel
        mainViewController.viewModel        = viewModel
        viewModel.delegate                  = self
        navigationController.pushViewController(mainViewController, animated: true)
    }
}

extension MainCoordinator : MainViewModelDelegate
{
    func didSelect(character: RAMCharacter)
    {
        let coordinator = RAMInfoCoordinator(navigationController: navigationController, character: character)
        coordinator.pushCoordinator(coordinator)
    }
}
