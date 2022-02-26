//
//  RAMInfoCell.swift
//  Elad'sproject
//
//  Created by elad schwartz on 25/02/2022.
//

import Foundation
import UIKit

class RAMInfoCell : UITableViewCell
{
    @IBOutlet weak var nameLabel    : UILabel!
    @IBOutlet weak var statusLabel  : UILabel!
    @IBOutlet weak var speciesLabel : UILabel!
    @IBOutlet weak var genderLabel  : UILabel!
    @IBOutlet weak var originLabel  : UILabel!
    
    func configure(with viewModel: InfoViewModel)
    {
        nameLabel.text      = viewModel.character.name
        statusLabel.text    = viewModel.character.status
        speciesLabel.text   = viewModel.character.species
        genderLabel.text    = viewModel.character.gender
        originLabel.text    = viewModel.character.origin?.name
    }
}
