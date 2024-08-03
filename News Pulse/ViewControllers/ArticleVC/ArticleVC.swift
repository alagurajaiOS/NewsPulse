//
//  ArticleVC.swift
//  News Pulse
//
//  Created by alagu-raja
//

import UIKit

class ArticleVC: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var sourceNameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var newsImageView: UIImageView!
    
    
    @IBOutlet weak var contentLabel: UILabel!
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "left_black_arrow"), for: .normal)
        
        //SET CONSTRAINS
        button.heightAnchor.constraint(equalToConstant: 45).isActive = true
        button.widthAnchor.constraint(equalTo: button.heightAnchor).isActive = true
        
        //ADD TARGET
        button.addTarget(self, action: #selector(backButtonTapped(_:)), for: .touchUpInside)
        
        return button
    }()
    
    lazy var optionButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "option_menu"), for: .normal)
        
        //SET CONSTRAINS
        button.heightAnchor.constraint(equalToConstant: 45).isActive = true
        button.widthAnchor.constraint(equalTo: button.heightAnchor).isActive = true
        
        return button
    }()
    
    
    let article: Article
    
    init(article: Article) {
        self.article = article
        super.init(nibName: "ArticleVC", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        configNavitaion()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func configNavitaion(){
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: optionButton)
    }
    
    private func setup(){
        profileImageView.roundRadius()
        if var content = article.content{
            for _ in 1...5{
                content = content + "\n\n" + content
            }
            setContent()
            func setContent(){
                // Calculate the line spacing in points
                let pixelLineSpacing: CGFloat = 21
                let pointLineSpacing = pixelLineSpacing / UIScreen.main.scale
                
                // Set the line spacing
                let attributedString = NSMutableAttributedString(string: content)
                let paragraphStyle = NSMutableParagraphStyle()
                paragraphStyle.lineSpacing = pointLineSpacing
                
                // Apply the paragraph style to the entire string
                attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedString.length))
                
                // Set the attributed text to the label
                contentLabel.attributedText = attributedString
            }
        }
        
        setTitle()
        func setTitle(){
            // Calculate the line spacing in points
            let pixelLineSpacing: CGFloat = 20
            let pointLineSpacing = pixelLineSpacing / UIScreen.main.scale
            
            // Set the line spacing
            let attributedString = NSMutableAttributedString(string: article.description ?? "")
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = pointLineSpacing
            
            // Apply the paragraph style to the entire string
            attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedString.length))
            
            // Set the attributed text to the label
            titleLabel.attributedText = attributedString
        }
        
        
        newsImageView.setImage(with: article.urlToImage, placeholderImage: #imageLiteral(resourceName: "thumbnail_image"))
        
        sourceNameLabel.text = article.source.name
        
        if let postedTime = article.publishedAt {
            timeLabel.text = convertDateString(originalString: postedTime, desiredFormat: "yyyy-MM-dd HH:mm")
        }
        
        func convertDateString(originalString: String, desiredFormat: String) -> String? {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
            //"yyyy-MM-dd'T'HH:mm:ss'Z'" // Input format (assuming UTC)
            guard let originalDate = formatter.date(from: originalString) else {
                print("Error: Invalid input date format.")
                return nil
            }
            
            
            // 2. Create a new formatter for the desired output format
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = "yyyy-MMM-dd h:mm a" // Adjust format as needed

            // 3. Convert the date to the desired string format
            let outputString = outputFormatter.string(from: originalDate)
            return outputString
        }
        
    }
    
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
    }
    
    @objc func backButtonTapped(_ button: UIButton){
        navigationController?.popViewController(animated: true)
    }

}
