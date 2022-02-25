//
//  ViewController.swift
//  Elad'sproject
//
//  Created by elad schwartz on 25/02/2022.
//

import UIKit

class MainViewController: UIViewController, Storyboardable
{
    @IBOutlet weak var tableView : UITableView!
    
    private var tableController : MainTableControllerProtocol!
    
    private var viewModel = MainViewModel()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        viewModel.getCharacters()
        viewModel.getLocation(url: "https://rickandmortyapi.com/api/location/3")
        setupUI()
    }
    
    private func setupUI()
    {
        //tableController.tableView = tableView
    }
}
