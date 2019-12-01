//
//  SettingsViewController.swift
//  mentr
//
//  Created by Stephanie Chen on 2019-11-30.
//  Copyright © 2019 Wren Liang. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    var checkedArray: [UIButton] = []
    var selectedButton: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        let newView = SettingsView()
        checkedArray.append(newView.checkBox)
        checkedArray.append(newView.checkBox2)
        checkedArray.append(newView.checkBox3)
        newView.checkBox.addTarget(self, action: #selector(checkMarkTapped), for: .touchUpInside)
        newView.checkBox2.addTarget(self, action: #selector(checkMarkTapped), for: .touchUpInside)
        newView.checkBox3.addTarget(self, action: #selector(checkMarkTapped), for: .touchUpInside)

        self.view = newView
        
        let testModal = ModalPopUpViewController()
        
        self.present(testModal, animated: true) {
            print("presented")
        }
    }
    
    @objc func checkMarkTapped(_ sender: UIButton) {
             for x in 0...2 {
                 checkedArray[x].isSelected = false
             }
            UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveLinear, animations: {
                sender.isSelected = !sender.isSelected
                sender.transform = .identity
            }, completion: nil)
            for x in 0...2 {
                if(checkedArray[x].isSelected) {
                    selectedButton = x
                }
            }
    }
}
