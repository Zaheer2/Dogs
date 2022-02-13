//
//  BreedNameTableViewCell.swift
//  DogsExplorer
//
//  Created by User on 2022-02-02.
//

import UIKit

class BreedNameTableViewCell: UITableViewCell {
    @IBOutlet weak var label_BreedName : UILabel!
    @IBOutlet weak var view_Bg : UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        view_Bg.backgroundColor = TargetSpecificConfigs.primary_Bg
    }
}
