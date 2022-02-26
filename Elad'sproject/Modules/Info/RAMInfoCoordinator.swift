//
//  RAMInfoCoordinator.swift
//  Elad'sproject
//
//  Created by elad schwartz on 26/02/2022.
//

import Foundation
import UIKit

class RAMInfoCoordinator : Coordinator
{
    private let navigationController : UINavigationController
    
    private let character : RAMCharacter
    
    init(navigationController : UINavigationController, character : RAMCharacter)
    {
        self.navigationController = navigationController
        self.character            = character
    }
    
    override func start()
    {
        let infoViewController  = InfoViewController.instantiate()
        infoViewController.name = character.name
        navigationController.pushViewController(infoViewController, animated: true)
       
    }
}
