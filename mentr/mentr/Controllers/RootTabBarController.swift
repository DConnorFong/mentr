//
//  FirstViewController.swift
//  mentr
//
//  Created by Wren Liang on 2019-11-30.
//  Copyright © 2019 Wren Liang. All rights reserved.
//

import UIKit

class RootTabBarController: UITabBarController {
    var ourTabBar: UITabBar!
    
    var updateDelegate: ServerUpdateDataDelegate?
    
    var apiButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 100))
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(testAPICall), for: .touchUpInside)
        button.setTitle("API CALL", for: .normal)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(apiButton)
        //Testing
        self.view.backgroundColor = UIColor.green
        //MARK: Tabbed Views
        tabBar.barStyle = .black
        let firstViewController = SwipeViewController()
        var tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "swipe"), selectedImage: UIImage(named: "swipe"))
        tabBarItem.imageInsets = UIEdgeInsets(top: 9, left: 0, bottom: -9, right: 0)
        firstViewController.tabBarItem = tabBarItem
        firstViewController.tabBarItem.tag = 0
        
        
        tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "list"), selectedImage: UIImage(named: "list"))
        tabBarItem.imageInsets = UIEdgeInsets(top: 9, left: 0, bottom: -9, right: 0)
        
        let secondViewController = NavigationController(rootViewController: MentorListViewController())
        secondViewController.tabBarItem = tabBarItem
        secondViewController.tabBarItem.tag = 1
        
        
        let thirdViewController = SettingsViewController()
        tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "settings"), selectedImage: UIImage(named: "settings"))
        tabBarItem.imageInsets = UIEdgeInsets(top: 9, left: 0, bottom: -9, right: 0)
        thirdViewController.tabBarItem = tabBarItem
        thirdViewController.tabBarItem.tag = 2
        
        let tabBarList = [firstViewController, secondViewController, thirdViewController]
        viewControllers = tabBarList
        
        self.updateDelegate = firstViewController
        
        initializeStructs()
    }
    
    //use to populate colors or person
    private func initializeStructs() {
        
    }
    
    @objc func testAPICall() {
        let url = URL(string: "http://ec2-18-222-96-240.us-east-2.compute.amazonaws.com/user/batch/0/10")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error)
            } else if let inData = data {
                let decodedData = try? JSONDecoder().decode(People.self, from: inData)
                
                globalArray = decodedData!
                print(decodedData)
                DispatchQueue.main.async {
                    self.updateDelegate?.updateData()
                }
            }
        }
        task.resume()
        
        
    }

}


