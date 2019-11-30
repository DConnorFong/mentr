//
//  FirstViewController.swift
//  mentr
//
//  Created by Wren Liang on 2019-11-30.
//  Copyright © 2019 Wren Liang. All rights reserved.
//

import UIKit

class RootTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Testing
        self.view.backgroundColor = UIColor.green
        
        //MARK: Tabbed Views
        let firstViewController = SwipeViewController()
        firstViewController.tabBarItem = UITabBarItem()
        firstViewController.tabBarItem.title = "SwipeView"
        firstViewController.tabBarItem.tag = 0
        firstViewController.tabBarItem.image = UIImage(systemName: "tray.2")
        
        let secondViewController = NavigationController(rootViewController: MentorListViewController())
        secondViewController.tabBarItem = UITabBarItem()
        secondViewController.tabBarItem.title = "Mentor List"
        secondViewController.tabBarItem.tag = 1
        secondViewController.tabBarItem.image = UIImage(systemName: "book")
        
        let tabBarList = [firstViewController, secondViewController]
        viewControllers = tabBarList
        
        
        
    }


}

