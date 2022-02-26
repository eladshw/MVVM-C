//
//  InfoViewController.swift
//  Elad'sproject
//
//  Created by elad schwartz on 26/02/2022.
//

import UIKit

class InfoViewController : UIViewController, Storyboardable
{
    @IBOutlet  weak var nameLabel: UILabel!
    
    var name : String!
    
    override func viewDidLoad()
    {
        nameLabel.text = name
    }
}
