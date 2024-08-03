//
//  ProfileOptionCell.swift
//  News Pulse
//
//  Created by alagu-raja
//

import UIKit

class ProfileOptionCell: UITableViewCell {

    @IBOutlet weak var optionLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var imageViewLeadingAnchor: NSLayoutConstraint!
    @IBOutlet weak var imageViewTrailingAnchor: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(with object: ProfileOption){
        optionLabel.text = object.title
        iconImageView.image = object.imageName
        optionLabel.textColor = object.textColor
        
        switch object.iconPosition {
        case .lead:
            self.imageViewLeadingAnchor.isActive = true
            self.imageViewTrailingAnchor.isActive = false
            break
        case .trail:
            self.imageViewLeadingAnchor.isActive = false
            self.imageViewTrailingAnchor.isActive = true
            break
        case .none:
            break
        }
    }
    
}
