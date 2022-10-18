//
//  TabBarControllerViewController.swift
//  Interesting Vocabulary Eng-Esp
//
//  Created by Umidjon Burhonov on 25/07/22.
//

import UIKit
 
class TabBarController: UITabBarController {

    lazy var AboutVc = UINavigationController(rootViewController: AboutViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.backgroundColor =  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        tabBar.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
//        tabBar.unselectedItemTintColor = .green
//        tabBar.barTintColor = .white



      let HomeVc = UINavigationController(rootViewController: HomeViewController())
        let RateVc = UINavigationController(rootViewController: HomeViewController())
        let ShareVc = UINavigationController(rootViewController: HomeViewController())

        HomeVc.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 1 )
        
        AboutVc.tabBarItem = UITabBarItem(title: "About", image: UIImage(systemName: "info.circle"), tag: 2)
        
        RateVc.tabBarItem = UITabBarItem(title: "Rate", image: UIImage(systemName: "star"), tag: 3)
        
        ShareVc.tabBarItem = UITabBarItem(title: "Share", image: UIImage(systemName: "square.and.arrow.up"), tag: 4)

        viewControllers = [HomeVc, RateVc, ShareVc,  AboutVc]
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.tag == 4 {
            shareApp()
        }
  
        if item.tag == 3 {
            RateApp()
        }
    }
    
   
    
    func shareApp()->Void{
       
      
            let someText:String = "Interesting Vocabulary Eng-Esp"
            let objectsToShare:URL = URL(string: "https://apps.apple.com/app/apple-store/id" + "\(Constants.appId)")!
            let sharedObjects:[AnyObject] = [objectsToShare as AnyObject,someText as AnyObject]
            let activityViewController = UIActivityViewController(activityItems : sharedObjects, applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = self.view

            activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook,UIActivity.ActivityType.postToTwitter,UIActivity.ActivityType.mail]
            self.present(activityViewController, animated: true, completion: nil)
            
        }
    
    
 
    
    
    func RateApp()->Void{
        
        let url = URL(string: "https://apps.apple.com/app/apple-store/id" + "\(Constants.appId)")!
        UIApplication.shared.open(url)
        }
}
