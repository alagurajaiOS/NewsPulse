//
//  TabBarVC.swift
//  News Pulse
//
//  Created by alagu-raja
//

import UIKit

class TabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        setTabBarVCS()
        updateTabBarIconsForCurrentAppearance()
        self.navigationItem.title = "My Other View Title"
    }
    
    func setTabBarVCS(){
        let vcArray = [ExploreVC(),HomeVC(),PremiumVC(),HomeVC(),ProfileVC()]
        self.viewControllers = vcArray
    }
    
    func updateTabBarIconsForCurrentAppearance() {
        guard let viewControllers = self.viewControllers else {
            return
        }
        for (index, viewController) in viewControllers.enumerated() {
            //FOR HOME VIEW CONTROLLER ICON
            if index == 0{
                viewController.tabBarItem.selectedImage = #imageLiteral(resourceName: "home_select").withRenderingMode(.alwaysOriginal)
                viewController.tabBarItem.image = #imageLiteral(resourceName: "home_unselect").withRenderingMode(.alwaysOriginal)
            }
            
            //FOR SEARCH VIEW CONTROLLER ICON
            else if index == 1{
                viewController.tabBarItem.selectedImage = #imageLiteral(resourceName: "search_select").withRenderingMode(.alwaysOriginal)
                viewController.tabBarItem.image = #imageLiteral(resourceName: "search_unselect").withRenderingMode(.alwaysOriginal)
            }
            
            //FOR COMPOSE VIEW CONTROLLER ICON
            else if index == 2{
                viewController.tabBarItem.selectedImage = #imageLiteral(resourceName: "premium_select").withRenderingMode(.alwaysOriginal)
                viewController.tabBarItem.image = #imageLiteral(resourceName: "premium_unselect").withRenderingMode(.alwaysOriginal)
            }
            
            //FOR NOTIFICATION VIEW CONTROLLER ICON
            else if index == 3{
                viewController.tabBarItem.selectedImage = #imageLiteral(resourceName: "saved_select").withRenderingMode(.alwaysOriginal)
                viewController.tabBarItem.image = #imageLiteral(resourceName: "saved_unselect").withRenderingMode(.alwaysOriginal)
            }
            
            //FOR LIBRAY VIEW CONTROLLER ICON
            else if index == 4{
                viewController.tabBarItem.selectedImage = #imageLiteral(resourceName: "profile_select").withRenderingMode(.alwaysOriginal)
                viewController.tabBarItem.image = #imageLiteral(resourceName: "profile_unselect").withRenderingMode(.alwaysOriginal)
            }
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
