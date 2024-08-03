//
//  SourceCollectionViewCell.swift
//  News Pulse
//
//  Created by alagu-16152 on 15/06/24.
//

import UIKit

class SourceCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var sourceProfileImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func config(data: Source){
//        if let sourceURL = data.url{
//            fetchMetaImage(from: sourceURL) { imageURL in
//                DispatchQueue.main.async{
//                    self.sourceProfileImage.setImage(with: imageURL, placeholderImage: UIImage(named: "thumbnail_image"))
//                }
//            }
////            ImageCache.shared.getImageFromChache(withURL: URL) { result in
////                switch result {
////                case .success(let image):
////                    DispatchQueue.main.async{
////                        sourceProfileImage.image = image
////                    }
////                case .failure(_):
////                    
////                }
////            }
//        }
        
    }

}


