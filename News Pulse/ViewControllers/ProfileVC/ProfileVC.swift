//
//  ProfileVC.swift
//  News Pulse
//
//  Created by alagu-raja
//

import UIKit

struct ProfileOption {
    let navigationType: ProfileOptionNavigation
    var title: String{
        return navigationType.rawValue
    }
    let imageName: UIImage? // Optional for image representation (if desired)
    let iconPosition: iconPosition?
    let textColor: UIColor!
    
    init(navigationType: ProfileOptionNavigation, imageName: UIImage?, iconPosition: iconPosition?, textColor: UIColor? = UIColor(named: "DARK_BLUE")) {
        self.navigationType = navigationType
        self.imageName = imageName
        self.iconPosition = iconPosition
        self.textColor = textColor
    }
    
    enum ProfileOptionNavigation: String {
        case profile = "My Profile"
        case subscription = "Subscription"
        case feedback = "Feedback"
        case faq = "FAQ"
        case privacyPolicy = "Privacy Policy"
        case logout = "Log out"
    }
    
    enum iconPosition{
        case lead
        case trail
    }
}


class ProfileVC: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    private let profileOptions: [ProfileOption] = [
        ProfileOption(navigationType: .profile, imageName: #imageLiteral(resourceName: "right_arrow"), iconPosition: .trail),
        ProfileOption(navigationType: .subscription, imageName: #imageLiteral(resourceName: "right_arrow"), iconPosition: .trail),
        ProfileOption(navigationType: .feedback, imageName: #imageLiteral(resourceName: "right_arrow"), iconPosition: .trail),
        ProfileOption(navigationType: .faq, imageName: #imageLiteral(resourceName: "right_arrow"), iconPosition: .trail),
        ProfileOption(navigationType: .privacyPolicy, imageName: #imageLiteral(resourceName: "right_arrow"), iconPosition: .trail),
        ProfileOption(navigationType: .logout, imageName: #imageLiteral(resourceName: "logout"), iconPosition: .lead, textColor: UIColor(named: "RED_COLOR"))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        //REGISTER CELL
        tableView.register(UINib(nibName: "ProfileDetatilCell", bundle: nil), forCellReuseIdentifier: "ProfileDetatilCell")
        tableView.register(UINib(nibName: "ProfileOptionCell", bundle: nil), forCellReuseIdentifier: "ProfileOptionCell")
    }
    
    func showLogoutAlert(){
        let alertController = UIAlertController(title: "Alert", message: "Are you sure want to LOGOUT", preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel)
        let logoutAction = UIAlertAction(title: "logout", style: .destructive){_ in
            UserDefaultManager.shared.markAsUserLogedin(false)
            if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
                sceneDelegate.setInititalViewController()
            }
        }
        alertController.addAction(cancelAction)
        alertController.addAction(logoutAction)
        self.present(alertController, animated: true)
    }

}

extension ProfileVC: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        } else{
            return profileOptions.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileDetatilCell", for: indexPath)
            return cell
        } else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileOptionCell", for: indexPath) as! ProfileOptionCell
            cell.configCell(with: profileOptions[indexPath.row])
            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let option = profileOptions[indexPath.row].navigationType
        switch option {
        case .profile:
            break
        case .subscription:
            break
        case .feedback:
            break
        case .faq:
            break
        case .privacyPolicy:
            break
        case .logout:
            showLogoutAlert()
            break
        }
    }
    
}
