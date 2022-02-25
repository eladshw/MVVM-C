//
//  ExtensionUITableView.swift
//  BetterMind
//
//  Created by elad schwartz on 14/04/2021.
//

import UIKit

extension UITableView
{
    func indexPath(from event: UIEvent?) -> IndexPath?
    {
        guard let event = event                    else { return nil }
        guard let point = event.location(in: self) else { return nil }
        return indexPathForRow(at: point)
    }
    
    func register(cells: [UITableViewCell.Type])
    {
        cells.forEach {register($0)}
    }
    
    func register<T: UITableViewCell>(_ cell: T.Type)
    {
        let nib = UINib(nibName: cell.viewIdentifier, bundle: nil)
        register(nib, forCellReuseIdentifier: cell.viewIdentifier)
    }
    
    func visibleCell(for indexPathObject: IndexPath) -> UITableViewCell?
    {
        for cell in visibleCells
        {
            guard let indexPathOfCell = indexPath(for: cell), indexPathOfCell == indexPathObject else { continue }
            return cell
        }
        return nil
    }
    
    public func dequeue<T: UITableViewCell>(cellClass: T.Type) -> T?
    {
        return dequeueReusableCell(withIdentifier: cellClass.reuseIdentifier) as? T
    }
    
    public func dequeue<T: UITableViewCell>(cellClass: T.Type, forIndexPath indexPath: IndexPath) -> T
    {
        guard let cell = dequeueReusableCell(
            withIdentifier: cellClass.reuseIdentifier, for: indexPath) as? T else {
                fatalError(
                    "Error: cell with id: \(cellClass.reuseIdentifier) for indexPath: \(indexPath) is not \(T.self)")
            }
        return cell
    }
    
    
}


extension UIEvent
{
    func location(in view: UIView) -> CGPoint?
    {
        guard let touch = allTouches?.first else { return nil }
        return touch.location(in: view)
    }
}

//
//  IBIdentifiable.swift
//  BetterMind
//
//  Created by elad schwartz on 24/05/2021.
//

import UIKit

protocol IBIdentifiable : NSObjectProtocol
{
    static var viewIdentifier : String { get }
}

extension IBIdentifiable
{
    static var viewIdentifier  : String
    {
        return String(describing: self)
    }
}

extension UIViewController  : IBIdentifiable {}
extension UIView            : IBIdentifiable {}

extension UITableViewCell
{
    static var reuseIdentifier: String
    {
        return String(describing: Self.self)
    }
}
