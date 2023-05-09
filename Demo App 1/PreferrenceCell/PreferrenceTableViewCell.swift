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
}

extension PreferrenceTableViewCell{
    static var nibName: String {
        return String(String(describing: self))
    }
    
    static var reusableCellIdentifier: String {
        return String(String(describing: self))
    }
}
