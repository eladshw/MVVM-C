//
//  MainTableController.swift
//  Elad'sproject
//
//  Created by elad schwartz on 25/02/2022.
//

import UIKit

protocol MainTableControllerProtocol : UITableViewDelegate, UITableViewDataSource
{
    var tableView : UITableView! { get set }
    var viewModel : MainViewModel! { get set }
    
    func reloadData()
}

protocol MainTableControllerDelegate : AnyObject
{
    func didSelect(character: RAMCharacter)
}

class MainTableController : NSObject, MainTableControllerProtocol
{
    weak var delegate     : MainTableControllerDelegate?
    var viewModel        : MainViewModel!
    
    weak var tableView    : UITableView!
    {
        didSet
        {
            setupTableView()
        }
    }
    
    private func setupTableView()
    {
        registerCells()
        tableView.delegate           = self
        tableView.dataSource         = self
    }
    
    private func registerCells()
    {
        tableView.register(cells: [RAMInfoCell.self])
    }
    
    func reloadData()
    {
        tableView.reloadData()
    }
    
}

//MARK: - UITableViewDataSource
extension MainTableController : UITableViewDataSource
{
    func tableView(_ tableView : UITableView, numberOfRowsInSection section : Int) -> Int
    {
        return viewModel.numbersOfCharacters
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
}

//MARK: - UITableViewDelegate
extension MainTableController : UITableViewDelegate
{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cellID = "RAMInfoCell"
        let cell   = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        handleCellConfiguration(for: cell, at: indexPath)
        
        return cell
    }
    
    private func handleCellConfiguration(for cell: UITableViewCell, at indexPath: IndexPath)
    {
        switch cell
        {
            case is RAMInfoCell : configureInfoCell(cell, by: indexPath)
            default             : break
        }
    }
    
    private func configureInfoCell(_ cell: UITableViewCell, by indexPath: IndexPath)
    {
        guard let cell = cell as? RAMInfoCell else { return }
        
        let viewModel = viewModel.getInfoViewModel(at: indexPath.row)
        cell.configure(with: viewModel)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let viewModel = viewModel.getInfoViewModel(at: indexPath.row)
        delegate?.didSelect(character: viewModel.character)
    }
}
