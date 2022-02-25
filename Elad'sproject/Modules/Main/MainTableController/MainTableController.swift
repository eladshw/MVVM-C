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
}

class MainTableController : NSObject, MainTableControllerProtocol
{
    weak var tableView: UITableView!
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
}

//MARK: - UITableViewDataSource
extension MainTableController : UITableViewDataSource
{
    func tableView(_ tableView : UITableView, numberOfRowsInSection section : Int) -> Int
    {
        return 1
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
//        let model = timelineData.data[safe: indexPath.section]?[safe: indexPath.row]
//
//        let cellID = getCellIdFor(model: model)
//        let cell   = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
//        handleCellConfiguration(for: cell, at: indexPath)
        
        return UITableViewCell()
    }
    
    private func handleCellConfiguration(for cell: UITableViewCell, at indexPath: IndexPath)
    {
        switch cell
        {
//        case is BTMTimelineCardCell             : configureCardCell(cell, by: indexPath)
//        case is BTMTimelineReflectionCardCell   : configureReflectionCardCell(cell, by: indexPath)
//        case is BTMTimelineTagCell              : configureTagCell(cell, by: indexPath)
        default                                 : break
        }
    }
}
