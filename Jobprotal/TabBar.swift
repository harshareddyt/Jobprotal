//
//  TabBar.swift
//  Jobprotal
//
//  Created by Sunny Reddy on 31/05/19.
//  Copyright © 2019 Harsha Reddy. All rights reserved.
//

import UIKit

class TabBar: UITabBarController {

    var tabBarIteem = UITabBarItem()


    override func viewDidLoad() {
        super.viewDidLoad()
//        let selectedImage = UIImage(named:   "home")?.withRenderingMode(.alwaysOriginal)
//        let deselctedImage = UIImage(named:   "home1")?.withRenderingMode(.alwaysOriginal)
//        tabBarIteem = self.tabBar.items![0]
//        tabBarIteem.image = deselctedImage
//        tabBarIteem.selectedImage = selectedImage
//
//        let selectedImage2 = UIImage(named:   "profile")?.withRenderingMode(.alwaysOriginal)
//        let deselctedImage2 = UIImage(named:  "profile1")?.withRenderingMode(.alwaysOriginal)
//        tabBarIteem = self.tabBar.items![2]
//        tabBarIteem.image = deselctedImage2
//        tabBarIteem.selectedImage = selectedImage2
        
        
        
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.red], for:.selected)
        
        self.selectedIndex = 0


    }
    

}
