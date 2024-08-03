//
//  NewsTableViewCell.swift
//  News Pulse
//
//  Created by alagu-raja
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var sourceView: UIView!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var newsImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setup()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(){
        selectionStyle = .none
//        sourceView.roundRadius()
    }
    
    func config(data: Article){
        dateLabel.text = formatDateString(data.publishedAt) ?? "00-00"
        setTitle()
        sourceLabel.text = data.source.name?.uppercased()
        newsImageView.setImage(with: data.urlToImage, placeholderImage: #imageLiteral(resourceName: "thumbnail_image"))
        
        
        func formatDateString(_ dateString: String?) -> String? {
            guard let dateString = dateString else { return nil }
            let inputFormatter = DateFormatter()
            inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            inputFormatter.locale = Locale(identifier: "en_US_POSIX")
            
            if let date = inputFormatter.date(from: dateString) {
                let outputFormatter = DateFormatter()
                outputFormatter.dateFormat = "MMM dd"
                return outputFormatter.string(from: date)
            } else {
                return nil
            }
        }
        
        func setTitle(){
            // Calculate the line spacing in points
            let pixelLineSpacing: CGFloat = 20
            let pointLineSpacing = pixelLineSpacing / UIScreen.main.scale
            
            // Set the line spacing
            let attributedString = NSMutableAttributedString(string: data.title ?? "")
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = pointLineSpacing
            paragraphStyle.lineBreakMode = .byTruncatingTail
            
            // Apply the paragraph style to the entire string
            attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedString.length))
            
            // Set the attributed text to the label
            titleLabel.isUserInteractionEnabled = true
            titleLabel.attributedText = attributedString
        }
        
    }
    
}
