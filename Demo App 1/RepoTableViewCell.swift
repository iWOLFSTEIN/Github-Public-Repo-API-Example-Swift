//
//  TableViewCell.swift
//  Demo App 1
//
//  Created by BrainX Technologies on 02/05/2023.
//

import SVGKit
import UIKit

class RepoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var profilePicUIImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var subContainerRight: UIView!
    @IBOutlet weak var programmingLangView: UIView!
    @IBOutlet weak var subContainerLeft: UIView!
    @IBOutlet weak var profilePicView: UIView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var subContainerLeftLeadingImageView: UIImageView!
    @IBOutlet weak var subContainerRightLeadingImageView: UIImageView!
    @IBOutlet weak var subContainerRightTrailingImageView: UIImageView!
    @IBOutlet weak var subContainerLeftLabel: UILabel!
    @IBOutlet weak var subContainerRightLabel: UILabel!

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        self.contentView.layer.cornerRadius = 15
        self.contentView.layer.borderWidth = 1
        self.contentView.layer.borderColor = UIColor(named: "cellBorderColor")?.cgColor
        
        profilePicView.layer.cornerRadius = 10
        profilePicUIImage.layer.cornerRadius = 10
        
        subContainerLeft.layer.cornerRadius = 10
        subContainerRight.layer.cornerRadius = 10
        programmingLangView.layer.cornerRadius = 5
                
        NSLayoutConstraint.activate([
            topView.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.6),
            bottomView.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.4),
        ])
        
        let starSvg = SVGKImage(named: "star")
        let personSvg = SVGKImage(named: "person")
        let pathSvg = SVGKImage(named: "path")
        
        subContainerLeftLeadingImageView.image = starSvg?.uiImage
        subContainerRightLeadingImageView.image = personSvg?.uiImage
        subContainerRightTrailingImageView.image = pathSvg?.uiImage
        
        subContainerLeftLabel.text = "\(String(Int.random(in: 100..<1000))) today"
        subContainerRightLabel.text = "\(String(Int.random(in: 100..<1000))) Contributors"
    }
    
}

extension RepoTableViewCell{
    static var nibName: String {
        return String(String(describing: self))
    }
    
    static var reusableCellIdentifier: String {
        return String(String(describing: self))
    }
}
