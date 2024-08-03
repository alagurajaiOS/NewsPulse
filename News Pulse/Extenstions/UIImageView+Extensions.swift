//
//  UIImageView+Extensions.swift
//  News Pulse
//
//  Created by alagu-raja
//

import UIKit

extension UIImageView {
    func setImage(with url: URL?,placeholderImage placeholder: UIImage?) {
        self.image = placeholder
        DispatchQueue.global(qos: .userInitiated).async {
            // Perform background tasks
            if let url = url {
                ImageCache.shared.getImage(withUrl: url) { (image) in
                    if let image = image{
                        // Update UI on the main thread
                        DispatchQueue.main.async {
                            self.image = image
                        }
                    }
                }
            }
        }
    }
}
