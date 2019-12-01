//
//  FirstViewController.swift
//  mentr
//
//  Created by Wren Liang on 2019-11-30.
//  Copyright © 2019 Wren Liang. All rights reserved.
//

import UIKit

class RootTabBarController: UITabBarController {

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
        
        
        initializeStructs()
    }
    
    //use to populate colors or person
    private func initializeStructs() {
        
    }
    
    @objc func testAPICall() {
        let url = URL(string: "http://ec2-18-222-96-240.us-east-2.compute.amazonaws.com/user/batch/0/150")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error)
            } else if let inData = data {
                let json = try? JSONSerialization.jsonObject(with: inData, options: [])
                print(json)
            }
        }
        task.resume()
        
    }

}

