//
//  LoginVC.swift
//  News Pulse
//
//  Created by alagu-raja
//

import UIKit
import Lottie

class LoginVC: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var animationView: LottieAnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loginButton.setCornerRadius(7)
    }

    @IBAction func loginButtonTapped(_ sender: Any) {
        for subView in view.subviews{
            subView.isHidden = true
        }
        animationView.isHidden = false
        animateGif()
        DispatchQueue.main.asyncAfter(deadline: .now()+3){
            UserDefaultManager.shared.markAsUserLogedin(true)
            if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
                sceneDelegate.setInititalViewController()
            }
        }
    }
    
    private func animateGif(){
        // 2. Start LottieAnimationView with animation name (without extension)
          
//          animationView = .init(name: "NewsLoader")
          
          // 3. Set animation content mode
          
          animationView.contentMode = .scaleAspectFit
          
          // 4. Set animation loop mode
          
          animationView.loopMode = .loop
          
          // 5. Adjust animation speed
          
          animationView.animationSpeed = 0.5
          
          // 6. Play animation
          
          animationView!.play()
    }
}
