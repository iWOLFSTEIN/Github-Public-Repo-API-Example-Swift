//
//  TableViewCell.swift
//  Demo App 1
//
//  Created by BrainX Technologies on 02/05/2023.
//

import UIKit
import SVGKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var subContainerRight: UIView!
    @IBOutlet weak var programmingLangView: UIView!
    @IBOutlet weak var subContainerLeft: UIView!
    @IBOutlet weak var profilePicView: UIView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var topView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        self.contentView.layer.cornerRadius = 15
        self.contentView.layer.borderWidth = 1
        self.contentView.layer.borderColor = CGColor(red: 199/255, green: 199/255, blue: 202/255, alpha: 1.0)
        // Configure the view for the selected state
//        self.contentView.subviews.first!.layer.cornerRadius = 10
//        self.contentView.subviews.first!.backgroundColor = .red
//        let maskLayer = CAShapeLayer()
//        maskLayer.path = UIBezierPath(roundedRect: topView.bounds,
//                                       byRoundingCorners: [.topLeft, .topRight],
//                                       cornerRadii: CGSize(width: 10, height: 10)).cgPath
//        topView.layer.mask = maskLayer
//        topView.layer.masksToBounds = true
        
        profilePicView.layer.cornerRadius = 10
        let profileImageView = profilePicView.subviews.first as! UIImageView
        profileImageView.layer.cornerRadius = 10
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
        
        let starImageView = subContainerLeft.subviews.first as! UIImageView
        starImageView.image = starSvg?.uiImage
        
        let personImageView = subContainerRight.subviews.first as! UIImageView
        personImageView.image = personSvg?.uiImage
        
        let pathImageView = subContainerRight.subviews[2] as! UIImageView
        pathImageView.image = pathSvg?.uiImage
        
        
        let starsCountLabel = subContainerLeft.subviews[1] as! UILabel
        starsCountLabel.text = "\(String(Int.random(in: 100..<1000))) today"
        
        let contributorCountLabel = subContainerRight.subviews[1] as! UILabel
        contributorCountLabel.text = "\(String(Int.random(in: 100..<1000))) Contributors"
    }
    
}
