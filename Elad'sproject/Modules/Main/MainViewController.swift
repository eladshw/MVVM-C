//
//  ViewController.swift
//  Elad'sproject
//
//  Created by elad schwartz on 25/02/2022.
//

import UIKit
import Combine

class MainViewController: UIViewController, Storyboardable
{
    @IBOutlet private weak var tableView : UITableView!
    
    private var subscriptions = Set<AnyCancellable>()
    
    var viewModel : MainViewModel!
    
    var tableController : MainTableControllerProtocol!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupUI()
        viewModel.getCharacters()
        viewModel.getLocation(url: "https://rickandmortyapi.com/api/location/3")
        
        viewModel.$characters
            .receive(on: DispatchQueue.main)
            .sink {[weak self] characters in
                guard let self = self else { return }
                self.tableController.reloadData()
        }
        .store(in: &subscriptions)
    }
    
    private func setupUI()
    {
        tableController.viewModel = viewModel
        tableController.tableView = tableView
    }
}
