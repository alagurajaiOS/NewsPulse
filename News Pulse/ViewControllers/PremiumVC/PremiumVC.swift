//
//  PremiumVC.swift
//  News Pulse
//
//  Created by alagu-raja
//

import UIKit

class PremiumVC: UIViewController {

    @IBOutlet weak var detatilView: UIView!
    @IBOutlet weak var monthButton: UIButton!
    @IBOutlet weak var yearButton: UIButton!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()
        
    }
    
    private func setup(){
        
        // Configure shadow properties
        detatilView.layer.cornerRadius = 10 // Optional: Add rounded corners
        detatilView.layer.masksToBounds = false // Optional: Clip content within bounds (if needed)
        detatilView.layer.shadowColor = UIColor.black.cgColor
        detatilView.layer.shadowOpacity = 0.3
        detatilView.layer.shadowOffset = CGSize(width: 2, height: 2)
        detatilView.layer.shadowRadius = 6
        
        buyButton.setCornerRadius(5)
        
    }

    @IBAction func buyButtonTapped(_ sender: Any) {
    }
    
    @IBAction func monthOrAnnualButtonTapped(_ sender: UIButton) {
        if sender.tag == 0{
            self.priceLabel.text = "$6.99"
            
            self.monthButton.setTitleColor(UIColor(named: "WHITE_COLOR"), for: .normal)
            self.monthButton.backgroundColor = UIColor(named: "PRIMARY_COLOR")
            
            self.yearButton.setTitleColor(UIColor(named: "DARK_BLUE_50"), for: .normal)
            self.yearButton.backgroundColor = UIColor(named: "WHITE_COLOR")
            
        } else{
            self.priceLabel.text = "$4.99"
            
            self.yearButton.setTitleColor(UIColor(named: "WHITE_COLOR"), for: .normal)
            self.yearButton.backgroundColor = UIColor(named: "PRIMARY_COLOR")
            
            self.monthButton.setTitleColor(UIColor(named: "DARK_BLUE_50"), for: .normal)
            self.monthButton.backgroundColor = UIColor(named: "WHITE_COLOR")
        }
    }
    
    
}
