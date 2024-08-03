//
//  RoundView.swift
//  News Pulse
//
//  Created by alagu-raja
//

import UIKit

class RoundView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    init() {
        super.init(frame: CGRect())
//        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        setup()
        self.clipsToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // Set the cornerRadius to half of the view's width to make it a circle
        if self.bounds.height != 0{
            self.layer.cornerRadius = self.bounds.height / 2.0
//            self.imageView?.layer.cornerRadius = self.bounds.height / 2.0
        }
    }

}

class RoundImageView: UIImageView {
    
    init() {
        super.init(frame: CGRect())
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // Set the cornerRadius to half of the view's width to make it a circle
        if self.bounds.height != 0{
            self.layer.cornerRadius = self.bounds.height / 2.0
//            self.imageView?.layer.cornerRadius = self.bounds.height / 2.0
        }
        
    }
    
    private func setup() {
        // Make sure to set clipsToBounds to true, so the content inside the imageView is also clipped to the rounded shape
        translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
    }
}
