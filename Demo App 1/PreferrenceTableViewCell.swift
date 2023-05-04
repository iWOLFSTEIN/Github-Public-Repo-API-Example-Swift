//
//  PreferrenceTableViewCell.swift
//  Demo App 1
//
//  Created by BrainX Technologies on 03/05/2023.
//

import UIKit

class PreferrenceTableViewCell: UITableViewCell {

    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var checkBoxImage: UIImageView!
    
    var isChecked: Bool = false
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
