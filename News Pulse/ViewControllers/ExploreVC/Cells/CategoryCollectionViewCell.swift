//
//  CategoryCollectionViewCell.swift
//  News Pulse
//
//  Created by alagu-16152 on 13/06/24.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var shadowView: UIView!
    
    @IBOutlet weak var categoryLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        categoryImageView.setCornerRadius(8)
        shadowView.setCornerRadius(8)
    }

}
