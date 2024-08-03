//
//  UIImage+Extensions.swift
//  News Pulse
//
//  Created by alagu-raja
//

import UIKit

extension UIView{
    func roundRadius(){
        self.layer.cornerRadius = self.bounds.height/2
    }
    
    func setCornerRadius(_ value: CGFloat){
        self.layer.cornerRadius = value
    }
}
