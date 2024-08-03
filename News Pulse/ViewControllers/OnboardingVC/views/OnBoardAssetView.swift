//
//  OnBoardAssetView.swift
//  News Pulse
//
//  Created by alagu-raja
//

import UIKit

@IBDesignable
class OnBoardAssetView: UIView {
    

    lazy var imageView: UIImageView = {
        let imageView = RoundImageView()
        return imageView
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .center
        label.config(text: nil, color: .black, alignment: .center, style: .bold, size: 28, noOfLines: 2)
        return label
    }()
    
    init(frame: CGRect, image: UIImage, text: String) {
        super.init(frame: frame)
        self.setConstraints()
        self.imageView.image = image
        self.label.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
//        nibSetup()
    }
    
    func setConstraints(){
        //imageView
        addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.widthAnchor.constraint(equalTo: widthAnchor, constant: -15),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
        ])
        
        //label
        addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
}


