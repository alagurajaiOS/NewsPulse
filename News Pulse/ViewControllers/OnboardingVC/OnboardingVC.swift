//
//  OnboardingVC.swift
//  News Pulse
//
//  Created by alagu-raja
//

import UIKit

class OnboardingVC: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var getStartButton: UIButton!
    
    private let onBoardData = [
        ("Read Latest\nNews Anytime.",#imageLiteral(resourceName: "on_board_1")),
        ("Get Early Access to\nForbes Magazines.",#imageLiteral(resourceName: "on_board_2")),
        ("Read what you like,\nSave what you love!.",#imageLiteral(resourceName: "on_board_3"))
    ]
    
    
    private var currentPageIndex: Int = 0
    
    private var isReadToStart: Bool = false{
        didSet{
            skipButton.isHidden = true
            getStartButton.isHidden = false
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUIElements()
        setupScrollView()
        // Do any additional setup after loading the view.
    }
    
    private func setupUIElements(){
        scrollView.isPagingEnabled = true
        scrollView.backgroundColor = .clear
        scrollView.delegate = self
        scrollView.showsHorizontalScrollIndicator = false
        
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .gray.withAlphaComponent(0.5)
        pageControl.backgroundColor = .clear
        pageControl.isUserInteractionEnabled = false
        
        getStartButton.layer.cornerRadius = 7
    }
    
    private func setupScrollView(){
        
        let scrollViewWidth = scrollView.bounds.width
        for (index,detail) in onBoardData.enumerated(){
            let frame = CGRect(x: CGFloat(index) * scrollViewWidth, y: 0, width: scrollViewWidth, height: scrollView.bounds.height)
            let (text,image) = detail
            let view = OnBoardAssetView(frame: frame, image: image, text: text)
            scrollView.addSubview(view)
        }
        scrollView.contentSize = CGSize(width: CGFloat(onBoardData.count) * scrollViewWidth, height: .zero)
    }

    @IBAction func pageControlValueChanged(_ sender: Any) {
        
    }
    
    @IBAction func skipButtonTapped(_ sender: Any) {
        let scrollViewWidth = scrollView.bounds.width
        let currentOffset = scrollView.contentOffset.x
        let newOffset = CGPoint(x: currentOffset + scrollViewWidth, y: 0)
        
        if newOffset.x < scrollView.contentSize.width {
            scrollView.setContentOffset(newOffset, animated: true)
        }
    }
    
    @IBAction func getStartButtonTapped(_ sender: Any) {
        
        UserDefaultManager.shared.markAsOnboarded()
        if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
            sceneDelegate.setInititalViewController()
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension OnboardingVC: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        currentPageIndex = Int(round(scrollView.contentOffset.x / scrollView.frame.width))
        self.pageControl.currentPage = currentPageIndex
        print(currentPageIndex)
        
        if !isReadToStart && currentPageIndex == onBoardData.count-1{
            isReadToStart = true
        }
    }
}
