//
//  UILabel+Extensions.swift
//  News Pulse
//
//  Created by alagu-raja
//

import UIKit

extension UILabel{
    enum FontStyle {
        case regular
        case bold
        case italic
        case boldItalic
    }
    
    func config(text: String?, color: UIColor, alignment: NSTextAlignment, style: FontStyle, size: CGFloat, noOfLines: Int = 1){
        
        self.text = text
        self.textColor = color
        self.numberOfLines = noOfLines
        
        switch style {
        case .regular:
            self.font = UIFont.systemFont(ofSize: size)
        case .bold:
            self.font = UIFont.boldSystemFont(ofSize: size)
        case .italic:
            self.font = UIFont.italicSystemFont(ofSize: size)
        case .boldItalic:
            if let descriptor = UIFont.systemFont(ofSize: size).fontDescriptor.withSymbolicTraits([.traitBold, .traitItalic]) {
                self.font = UIFont(descriptor: descriptor, size: size)
            } else {
                self.font = UIFont.systemFont(ofSize: size)
            }
        }
    }
}
