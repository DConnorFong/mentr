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
    
    var settingsController: SettingsViewController!
    
    var updateDelegate: ServerUpdateDataDelegate?
    
    var apiButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.layer.cornerRadius = 40
        button.addTarget(self, action: #selector(testAPICall), for: .touchUpInside)
        button.setImage(UIImage(named: "refresh"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isHidden = true
        button.isEnabled = false
        
        return button
    }()
    override func viewWillAppear(_ animated: Bool) {
        self.selectedIndex = 2
    }
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
        
        self.settingsController = thirdViewController
        
        let tabBarList = [firstViewController, secondViewController, thirdViewController]
        viewControllers = tabBarList
        
        self.updateDelegate = firstViewController
        
        
        constraintLayout()
    }
    
    //use to populate colors or person
    private func constraintLayout() {
        apiButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        apiButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
        apiButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        apiButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -110).isActive = true

    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.tag == 2 {
            apiButton.isEnabled = true
            apiButton.isHidden = false
        } else {
            apiButton.isEnabled = false
            apiButton.isHidden = true
        }
    }
    
    @objc func testAPICall() {
        var url: URL!
        if settingsController.selectedButton == 0 {
            url = URL(string: "http://ec2-18-222-96-240.us-east-2.compute.amazonaws.com/user/batch/engineering")!
        } else if settingsController.selectedButton == 1{
            url = URL(string: "http://ec2-18-222-96-240.us-east-2.compute.amazonaws.com/user/batch/science")!
        } else {
            url = URL(string: "http://ec2-18-222-96-240.us-east-2.compute.amazonaws.com/user/batch/commerce")!
        }
        
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


